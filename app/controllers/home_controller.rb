class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  
  # GET /index
  # GET /index.json
  def index; end
end
