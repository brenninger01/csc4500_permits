class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def configure_permitted_parameters
  	added_attrs = [:email, :password, :password_confirmation, :position]
  	devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  	devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def user_not_authorized
    flash[:alert] = "Ah Ah Ah, You didn't say the magic word, and don't have access to view that page."
    redirect_to(request.referrer || root_path)
  end
end
