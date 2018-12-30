module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:session])
  end
  
  def logged_in?
    !!current_user
  end
    
end
