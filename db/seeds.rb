
require 'faker'

user_admin = User.find_by(name: 'admin')
if user_admin.nil?
  User.create!(
    name: 'admin',
    email: 'admin@admin.com',
    password: 'password',
    password_confirmation: 'password',
    admin: true
  )
else
  user_admin.toggle!(:admin) if !user_admin.admin
end

10.times do |n|
  name = Faker::Name.name.gsub(' ', '').gsub(',', '')
  pass = 'password'
  p name
  User.create!(
    name: name,
    email: "#{name}@example.com",
    password: pass,
    password_confirmation: pass
  )
end