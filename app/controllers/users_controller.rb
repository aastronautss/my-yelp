class UsersController < ApplicationController
  before_action :require_logged_out

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:success] = 'Your account has been created! You may now log in.'
      redirect_to login_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :email, :password, :first_name, :last_name
  end
end
