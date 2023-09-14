class HomeController < ApplicationController
  def index
		@user = User
		@admin = Admin
		@educ = Educ
  end
end
