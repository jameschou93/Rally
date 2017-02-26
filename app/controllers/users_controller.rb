class UsersController < ApplicationController
  def new

  end

  def create
    user = User.new(first_name: params[:first_name], 
                       last_name: params[:last_name],
                       email: params[:email], 
                       password: params[:password], 
                       password_confirmation: params[:password_confirmation],
                       username: params[:username])
    if user.save
      flash[:success] = "New User Created"
    redirect_to "/signin"
    elsif user.errors.any?
      flash[:error]= "#{user.errors.full_messages.first}"
      redirect_to "/signup"
    else
      flash[:error] = "Could not create new user"
      redirect_to "/signup"
    end
  end

end
