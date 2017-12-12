Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Home Page
  get '/', to: 'home#index'
  get 'home', to: 'home#index'

  # API Routes
  # https://collectiveidea.com/blog/archives/2013/06/13/building-awesome-rails-apis-part-1
  # http://railscasts.com/episodes/350-rest-api-versioning?view=asciicast
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      get 'ping', to: 'ping#index'
    end
  end

  # Root
  root 'home#index'
end
