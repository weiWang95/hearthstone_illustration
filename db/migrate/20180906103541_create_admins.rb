class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :username, comment: '用户名'
      t.string :password_digest, comment: '密码'
      t.string :last_login_ip, comment: '上次登录IP'
      t.datetime :last_login_at, comment: '上次登录时间'

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
