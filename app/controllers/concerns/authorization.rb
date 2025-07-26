module Authorization
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!
  end

  private

  def require_owner
    redirect_to root_path, alert: "Access denied. Store owner privileges required." unless current_user&.owner?
  end

  def require_chef
    redirect_to root_path, alert: "Access denied. Chef privileges required." unless current_user&.chef?
  end

  def require_chef_or_owner
    redirect_to root_path, alert: "Access denied. Kitchen access required." unless current_user&.chef? || current_user&.owner?
  end
end
