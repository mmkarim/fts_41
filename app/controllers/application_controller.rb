class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  protected
  def after_sign_in_path_for resource
    current_user.admin? ? rails_admin_path : root_path
  end
end
