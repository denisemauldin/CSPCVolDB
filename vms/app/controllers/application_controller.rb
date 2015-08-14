class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

   def access_denied(exception)
    redirect_to root_path, :alert => exception.message
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :member_number, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :member_number, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :member_number, :password, :password_confirmation, :current_password) }
  end
  
  def authenticate_admin_user!
    raise SecurityError unless current_user.try(:admin?)
  end
  
  rescue_from SecurityError do |exception|
    redirect_to root_url
  end
end
