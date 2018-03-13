class Admin::UsersController < ApplicationController
  layout 'admin'
  before_action :set_user, only: %i[show edit update]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show; end

  # GET /users/1/edit
  def edit; end

  # PATCH /users/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_url }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email,
      :username,
      :first_name,
      :last_name,
      :role
    )
  end
end
