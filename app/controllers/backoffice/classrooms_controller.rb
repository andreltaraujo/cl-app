class Backoffice::ClassroomsController < ApplicationController

	def index
		@classrooms = Classroom.find_classrooms(params)
		render json: Hash[@classrooms]
  end
end
