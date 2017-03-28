class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_filter :photos

   def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def photos
      if current_user === nil
      @photos = current_user.photos
      else
      @photos = Photo.all
      end 
    end

    def authenticate!
      redirect_to "/" unless current_user
    end

    def today
      start_date = Time.now
    end
end
