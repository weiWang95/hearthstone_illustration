class ApplicationController < ActionController::Base
  include ExceptionHandler
  include ControllerRenderHelper

  protect_from_forgery with: :exception

  helper_method :current_user

  private

  def current_user
    @_current_user ||= begin
      if (user_id = session[:current_user_id])

      end
    end
  end

  def user_sign_in(user)
    session[:current_user_id] = user.id
  end

  def user_sign_out
    session[:current_user_id] = nil
    @_current_user = nil
  end

  def redirect_back_or(fallback_location)
    redirect_to(session[:forwarding_path] || fallback_location)
    session[:forwarding_path] = nil
  end

  def store_forwarding_path
    session[:forwarding_path] = request.path if request.get?
  end
end
