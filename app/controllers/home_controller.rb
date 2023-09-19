class HomeController < ApplicationController
  layout 'application'

	def index
		@user = User
		@admin = Admin
		@educ = Educ
  end
end
