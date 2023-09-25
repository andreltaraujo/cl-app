class Backoffice::UserProfilesController < ApplicationController
  layout 'admins'
	include ActionView::RecordIdentifier
	before_action :set_user_profile, only: :show
	before_action :set_rooms, only: :new

	def index
		@users = UserProfile.order(:first_name).page(params[:page]).search(params)
  end

	def show
		@user_profile.enrollments.each do |enroll|
			@rooms = Classroom.where(project_id: enroll.project_id, ceic_id: enroll.ceic_id)
		end
	end

	def new
		@user_profile = UserProfile.new
		@user_profile.build_user
		@user_profile.build_address
	end

	def create
		@user_profile = UserProfile.new(user_profile_params)
		if @user_profile.save
			redirect_to backoffice_user_profile_path(@user_profile), notice: t('devise.registrations.signed_up', resource_name: @user_profile.first_name)
		else
			@rooms = Classroom.where(project_id: 1, ceic_id: 1)
			@user_profile.build_user
			@user_profile.build_address
			render :new
		end
	end

	private

	def set_user_profile
		@user_profile = UserProfile.find(params[:id])
	end

	def set_rooms
		@rooms = Classroom.where(project_id: 1, ceic_id: 1)
	end

	def user_profile_params
		params.require(:user_profile).permit(
			:first_name,
			:last_name,
			:birthdate,
			:genre,
			:father_name,
			:mother_name,
			:school_id,
			:active,
			user_attributes: [:email,	:password, :password_confirmation],
			phone_numbers_attributes: [:id, :number, :description, :_destroy],
			address_attributes: [:street, :number, :neighborhood, :city, :state, :zipcode],
			enrollments_attributes: [:canceled, :project_id, :ceic_id, :classroom_id, :created_at, :_destroy]
		)
	end
end
