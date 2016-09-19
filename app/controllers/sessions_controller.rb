class SessionsController < ApplicationController
  before_action :require_logged_out, only: [:new, :create]
  before_action :require_user, only: [:destroy]

  def new
  end

  def create
    user = User.find_by email: params[:email]

    if user && user.authenticate(params[:password])
      login user
      redirect_to home_path
    else
      flash[:danger] = 'Something was wrong with your email or password.'
      redirect_to login_path
    end
  end

  def destroy
    logout
    flash[:success] = 'You have successfully logged out.'
    redirect_to root_path
  end
end
