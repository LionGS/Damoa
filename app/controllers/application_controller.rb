class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :configure_account_update_params, only: [:update]
  protected
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:tag_list])
  end
end
