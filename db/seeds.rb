# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do
User.create(username: Faker::Name.name, password_digest: "123", email: Faker::Internet.email)
end

5.times do
Question.create(title: Faker::Commerce.product_name + "?", body: Faker::Lorem.paragraph + "?", user_id: 1)
end


5.times do |n| 
Answer.create(content: Faker::Hacker.say_something_smart, user_id: n, post_id: n)
n + 1 
end


5.times do |n| 
Comment.create(commentable_id: n, commentable_type: "true", content: Faker::Company.catch_phrase, user_id: n, post_id: n)
n + 1
end

5.times do |n| 
Comment.create(commentable_id: n, commentable_type: "true", content: Faker::Company.catch_phrase, user_id: n, post_id: n)
n + 1
end

5.times do |n|
Tag.create(name:Faker::Commerce.department)
end
