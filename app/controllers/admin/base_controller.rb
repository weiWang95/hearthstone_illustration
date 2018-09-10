class Admin::BaseController < ApplicationController::Base
  include ExceptionHandler
  include ControllerRenderHelper

  protect_from_forgery with: :exception

  before_action :authenticate_user!

  layout 'admin'

  helper_method :current_admin

  private

  def authenticate_user!
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
  end

  def admin_sign_out
    session[:current_admin_id] = nil
    @_current_admin = nil
  end
end
