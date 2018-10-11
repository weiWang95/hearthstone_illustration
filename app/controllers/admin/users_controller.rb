class Admin::UsersController < Admin::BaseController
  before_action :load_crumb

  def index

  end

  private

  def load_crumb
    add_crumb('用户管理', admin_users_path)
  end
end
