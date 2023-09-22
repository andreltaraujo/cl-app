class Backoffice::EducProfilesController < ApplicationController
	before_action :authenticate_educ!, except: [:index, :new, :create]
	before_action :set_classroom_educ, only: [:show, :edit, :update]
	before_action :educ_layout, except: [:index, :new, :create]
	
	def index
		@educ_profiles = EducProfile.all
	end

	def show
		@classroom = Classroom.where(projec_id: @educ_profile.project_id, ceic_id: @educ_profile.ceic_id)
	end

	def new
		@educ_profile = EducProfile.new
	end

	def create
		@educ_profile = EducProfile.new(educ_profile_params)
		if @educ_profile.save
			redirect_to backoffice_educ_profiles_path, notice: "#{t('devise.registrations.signed_up', resource_name: @educ_profile.name)}"
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @educ_profile.update_with_password(params_educ)
			redirect_to backoffice_educ_profile_path(@educ_profile), notice: "#{t('devise.registrations.updated', resource_name: @educ_profile.name)}"
		else
			render :edit
		end
	end

	def destroy
	end

	private
	
	def educ_layout
		render :layout => 'educs'
	end

	def set_classroom_educ
		@educ_profile = EducProfile.find(params[:id])
		@classrooms = Classroom.where(project_id: @educ_profile.project_id, ceic_id: @educ_profile.ceic_id)
	end
	
	def educ_profile_params
		params.require(:educ).permit(:name, :email, :current_password, :password, :password_confirmation, :project_id, :ceic_id)
	end
	end
