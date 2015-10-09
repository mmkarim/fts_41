class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    if current_user.admin?
      redirect_to "/admin", alert: exception.message
    else
      redirect_to "/", alert: exception.message
    end
  end

  protected
  def after_sign_in_path_for resource
    current_user.admin? ? rails_admin_path : root_path
  end
end
