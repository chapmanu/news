Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  ############################
  # Home
  ############################
  get '/', to: 'home#index'
  get 'home', to: 'home#index'

  ############################
  # Admin Routes
  ############################
  get 'admin', to: 'admin/users#index'

  # Root
  root 'home#index'
end
