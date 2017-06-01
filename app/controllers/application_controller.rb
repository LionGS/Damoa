class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :configure_account_update_params, only: [:update]
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:tag_list])
  end


  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

end
