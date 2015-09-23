# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!(
  username:     'Bob',
  email:    'bob@example.com',
  password: 'password'
)

i = 0
10.times do
  i += 1
  Item.create!(user: user, name: "Task #{i}")
end
