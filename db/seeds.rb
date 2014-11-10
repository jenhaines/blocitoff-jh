require 'faker'

# Create Users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: "helloworld"
    # password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Note: by calling `User.new` instead of `create`,
# we create an instance of User which isn't immediately saved to the database.

# The `skip_confirmation!` method sets the `confirmed_at` attribute
# to avoid triggering an confirmation email when the User is saved.

# The `save` method then saves this User to the database.


# # Create Todos
# 50.times do
#   Todo.create!(
#     user:   users.sample,
#     description:  Faker::Lorem.sentence,
#     created_at: Faker::Date.backward(14)
#     # body:   Faker::Lorem.paragraph
#   )
# end

# Create an admin user
admin = User.new(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
  # role:     'admin'
)
admin.skip_confirmation!
admin.save

puts "Seed finished"
puts "#{User.count} users created"
# puts "#{Todo.count} todos created"
