class Backoffice::EnrollmentsController < ApplicationController
  layout 'admins'

	before_action :set_enrollment, only: [:show, :edit]

	def index
		@enrollments = Enrollment.order(:id).page(params[:page])
	end

	def show
	end

	def new
		@enrollment = Enrollment.new
	end

	def create
		@enroll = Enrollment.new(enrollment_params)
	end

	def edit
	end

	private

	def set_enrollment
		@enrollment = Enrollment.find(params[:id])
	end

		def enrollment_params
		params.require(:enrollment).permit(:canceled, :project_id, :ceic_id, :classroom_id)
	end
end
