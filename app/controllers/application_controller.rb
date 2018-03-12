class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  # See https://github.com/plataformatec/devise#strong-parameters
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
  end
end
