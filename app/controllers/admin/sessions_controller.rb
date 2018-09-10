class Admin::SessionsController < Admin::BaseController
  skip_before_action :authenticate_user!

  def new
  end

  def create
    admin = Admin.find_by(username: params[:username])

    if admin && admin.authenticate(params[:password])
      admin_sign_in(admin)
      admin.reflush_last_login(request.remote_ip)
    else
      render 'new'
    end
  end
end