class Admin < ApplicationRecord
  include SoftDeletable

  has_secure_password

  validates :password, length: { minimum: 6 }

  def reflush_last_login(ip)
    update!(last_login_at: Time.current, last_login_ip: ip)
  end
end