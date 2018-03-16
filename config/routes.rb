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

  # Need to list these individually to remove admin_ prefix
  get 'admin/users/:id',      to: 'admin/users#show', as: 'user'
  get 'admin/users/:id/edit', to: 'admin/users#edit', as: 'edit_user'
  patch 'admin/users/:id',    to: 'admin/users#update'

  # Root
  root 'home#index'
end
