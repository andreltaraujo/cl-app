class Backoffice::AdminProfilesController < ApplicationController
  before_action :authenticate_admin!
	before_action :set_admin_profile, only: [:show, :edit]
	layout 'admins'
	def index
		@admin_profiles = AdminProfile.all
  end

	def show
	end

	def new
		@admin_profile = AdminProfile.new
	end

	def create
		@admin_profile = AdminProfile.new(admin_profile_params)
		if @admin_profile.save
			redirect_to backoffice_admin_profile_path(@admin_profile), notice: "#{t('devise.registrations.signed_up', resource_name: @admin_profile.name)}"
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @admin_profile.update_with_password(params_admin_profile)
			redirect_to backoffice_admin_profile_path(@admin_profile), notice: "#{t('devise.registrations.updated', resource_name: @admin_profile.name)}"
		else
			render :edit
		end
	end

	def destroy
	end

	private

	def admin_profile_params
		params.require(:admin_profile).permit(:name, :role, :active,
			user_attributes: [:email, :current_password, :password, :password_confirmation]
		)
	end
	
	def set_admin_profile
		@admin_profile = AdminProfile.find(params[:id])
	end
end
