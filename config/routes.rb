Rails.application.routes.draw do

  root 'home#index'

	devise_for :users
  devise_for :educs
  devise_for :admins

	namespace :backoffice do
		resources :admin_profiles,
		:educ_profiles,
		:user_profiles,
		:programs,
		:projects,
		:enrollments,
		:classrooms,
		:lessons,
		:attendances
	 get '/analytics', to: 'analytics#index'
	 get '/users_reports', to: 'analytics#users_reports'
	 get '/enrollments_reports', to: 'analytics#enrollments_reports'
	 get '/projects_reports', to: 'analytics#projects_reports'
	end
end
