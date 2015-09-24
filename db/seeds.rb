# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!(
  username: Faker::Name.name,
  email:    'bob@example.com',
  password: 'password'
)

10.times do
  Item.create!(user: user, name: Faker::Lorem.sentence(2, false, 3))
end
