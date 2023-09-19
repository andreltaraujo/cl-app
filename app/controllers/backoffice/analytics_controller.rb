class Backoffice::AnalyticsController < ApplicationController
  layout 'analytics'
	
	def index
		@users = UserProfile.all
		@enrollments = Enrollment.all
		@projects = Project.all
	end
end
