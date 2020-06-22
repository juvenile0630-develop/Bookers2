class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def index
  end

protected
  def after_sign_in_path_for(resource)
    mypage_path
  end
  def after_sign_out_path_for(resource)
    '/users/sign_in'
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up){ |u| u.permit(:name, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:sign_in){ |u| u.permit(:name, :password, :password_confirmation) }
  end


end