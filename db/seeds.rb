Admin.find_or_create_by(username: ENV['ADMIN_USERNAME'] || 'winse', password: ENV['ADMIN_PASSWORD'] || '123456')
