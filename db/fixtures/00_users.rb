['John', 'Mary'].each do |name|
  User.seed do |s|
    s.first_name = name
    s.last_name = 'Doe'
    s.email = "#{name.downcase}@ynad.com"
    s.password = 'password123'
    s.password_confirmation = 'password123'
    s.ynab_access_token = SecureRandom.base64
  end
end
