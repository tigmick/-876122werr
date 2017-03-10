class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, :role,:first_name,:last_name,:contact_no)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:email, :password, :password_confirmation, :role,:first_name,:last_name,:contact_no,:current_password)}
  end

  protected

  def after_sign_in_path_for(resource)
    resource.email == "tigmicheal@yahoo.co.uk" ? admin_dashboard_path : users_dashboard_path 
  end
end
