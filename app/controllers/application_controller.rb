class ApplicationController < ActionController::Base
	layout 'admins'

	protected

	def after_sign_in_path_for(resource)
		if resource_class == Admin
			backoffice_analytics_path
		elsif resource_class == User
			backoffice_user_path(resource)
		else resource_class == Educ
			backoffice_educ_path(resource)
		end
  end
end