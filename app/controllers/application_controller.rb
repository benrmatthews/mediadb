class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_filter :configure_permitted_parameters, if: :devise_controller?
 
  protected
 
  def configure_permitted_parameters
  	#This allows the attributes to be accessible at sign up. I had to add email and password after adding token. 
  	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :stripe_card_token, :email, :password) }
  	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :stripe_card_token) }
  end
  
  private

  def user_not_authorized
    flash[:alert] = "Access denied."
    redirect_to (request.referrer || root_path)
  end

end
