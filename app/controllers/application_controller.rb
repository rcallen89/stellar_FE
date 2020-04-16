class ApplicationController < ActionController::Base

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    if current_user == nil
      redirect_to "/", status: "404"
      flash[:error] = "Not Found"
    end
  end
end


