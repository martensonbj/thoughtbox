class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:error] = "Invalid login credentials. Please try again or create a new account."
      redirect_to root_path
    end
  end


end
