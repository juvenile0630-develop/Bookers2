class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def index
  end

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up){ |u| u.permit(:name, :password, :password_confirmation) }
#    devise_parameter_sanitizer.permit(:sign_in){ |u| u.permit(:name, :password, :password_confirmation) }
  end


end
