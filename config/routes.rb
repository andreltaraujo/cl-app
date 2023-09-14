Rails.application.routes.draw do
  
  devise_for :users
  devise_for :educs
  devise_for :admins

  root 'home#index'
end
