class SessionsController < ApplicationController
  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
      flash[:success] = "You are logged in as #{user.username}"
    end
    redirect_to dashboard_path
  end

  def destroy
    session.clear
    flash[:success] = "Successfully logged out. Goodbye!"
    redirect_to root_path
  end
end
