class SessionsController < ApplicationController
  def create
    redirect_to catalogs_path if logged_in?
    find_user_and_redirect
  end

  private

  def find_user_and_redirect
    @user = User.find_by(username: params[:username])

    login_is_valid = !@user.nil? && @user.authenticate(params[:password])

    unless login_is_valid
      redirect_to login_path
      return
    end

    session[:user_id] = @user.id
    redirect_to catalogs_path
  end
end
