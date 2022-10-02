class SessionsController < ApplicationController
  def login
    if logged_in?
      redirect_to catalogs_path
    end
  end
  def create
    if logged_in?
      redirect_to catalogs_path and return
    end

    if find_user_and_login
      redirect_to catalogs_path
    else
      redirect_to login_path, notice: "User could not be logged in. Please check username/password and try again!"
    end
  end

  def destroy
    session[:user_id] = nil
  end

  private

  def find_user_and_login
    @user = User.find_by(username: params[:username])

    login_is_valid = !@user.nil? && @user.authenticate(params[:password])

    if login_is_valid
      session[:user_id] = @user.id
    end

    login_is_valid
  end
end
