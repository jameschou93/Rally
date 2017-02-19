class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome #{user.first_name}"
      redirect_to "/groups"
    else
      flash[:error]= "invalid email or password"
      redirect_to "/login"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:error] = "Logged Out"
    redirect_to "/login"
  end
end
