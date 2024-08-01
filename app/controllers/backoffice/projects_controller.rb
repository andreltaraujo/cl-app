class Backoffice::ProjectsController < ApplicationController
	before_action :authenticate_admin!
	before_action :set_project, only: :show
	layout 'admins'

	def index
		@projects = Project.all
	end

	def show
	end

	private

	def set_project
		@project = Project.find(params[:id])
	end
end
