# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


100.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@testusers.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end


#create! is the same as create except that it raises an exception for an invalid user rather than returning false. 

#create Test admin user
User.create!(name:  "Admin User",
             email: "admin@example.org",
             password:              "adminexample",
             password_confirmation: "adminexample",
             admin: true)


10.times do 
  name = Faker::Name.name 
  unit = "Rails"
  Lesson.create!(
            name: name, 
            unit: unit)

end 


users = User.order(:created_at).take(6)
50.times do
  title = Faker::Lorem.sentence(2)
  description = Faker::Lorem.sentence(5)
  link = Faker::Internet.url
  lesson = "Rails"
  users.each { |user| user.tips.create!(
    title: title,
    description: description,
    link: link,
    lesson_id: rand(1..10)) }
end