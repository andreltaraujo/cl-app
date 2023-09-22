class Backoffice::AnalyticsController < ApplicationController
  layout 'admins'
	
	def index
		@users = UserProfile.all
		@enrollments = Enrollment.all
		@projects = Project.all
	end
end
