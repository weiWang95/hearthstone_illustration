class Admin::BaseController < ActionController::Base
  include ExceptionHandler
  include ControllerRenderHelper
  include CrumbHelper

  protect_from_forgery with: :exception

  before_action :authenticate_admin!

  layout 'admin'

  helper_method :current_admin

  private

  def authenticate_admin!
    render_unauthorized && return if current_admin.blank?
  end

  def current_admin
    @_current_admin ||= begin
      if (admin_id = session[:current_admin_id])
        Admin.find_by(id: admin_id)
      end
    end
  end

  def admin_sign_in(admin)
    session[:current_admin_id] = admin.id
    admin.reflush_last_login(request.remote_ip)
  end

  def admin_sign_out
    session[:current_admin_id] = nil
    @_current_admin = nil
  end

  def redirect_back_or(fallback_location)
    redirect_to(session[:admin_forwarding_path] || fallback_location)
    session[:admin_forwarding_path] = nil
  end

  def store_forwarding_path
    session[:admin_forwarding_path] = request.path if request.get?
  end
end
