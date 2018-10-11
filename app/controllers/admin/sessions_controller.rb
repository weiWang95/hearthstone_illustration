class Admin::SessionsController < Admin::BaseController
  skip_before_action :authenticate_admin!, only: [:new, :create]

  layout 'admin_login'

  def new
    redirect_to admin_dashboards_path if current_admin
  end

  def create
    admin = Admin.find_by(username: params[:username])

    if admin && admin.authenticate(params[:password])
      admin_sign_in(admin)
      redirect_to admin_dashboards_path
    else
      flash[:error] = '用户名或者密码错误'
      render 'new'
    end
  end

  def destroy
    admin_sign_out
    redirect_to new_admin_sessions_path
  end
end