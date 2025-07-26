class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Authorization
  helper_method :user_chef?, :user_owner?

  def user_chef?
    user_signed_in? && current_user.has_role?(:chef)
  end

  def user_owner?
    user_signed_in? && current_user.has_role?(:owner)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :role ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :role ])
  end
end
