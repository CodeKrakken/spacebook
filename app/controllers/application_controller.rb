class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def redirect_if_user_is_not_signed_in
    if !user_signed_in?
      redirect_to root_url
    end
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  #Devise methods
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :surname])
  end

  def after_sign_in_path_for(resource)
   :posts
  end
  #end of devise methods

end
