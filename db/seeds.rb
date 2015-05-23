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

5.times do |n|
  Question.create(title: Faker::Commerce.product_name + "?", content: Faker::Lorem.paragraph(4) + "?", user: User.all.to_a.sample)
end


5.times do |n|
  Answer.create(content: "Well, what you should really be doing is " + Faker::Company.catch_phrase + "!", user_id: n, question_id: n)
end


5.times do |n|
  Comment.create(commentable_id: n, commentable_type: "Question", content: "Personally, I think " + Faker::Company.catch_phrase + "  is a much better solution.", user_id: n)
end

5.times do |n|
  Comment.create(commentable_id: n, commentable_type: "Answer", content: Faker::Company.catch_phrase + " sucks!", user_id: n)
end

30.times do |n|
  Tag.create(name:Faker::Commerce.department)
end

questions = Question.all
tags = Tag.all

15.times do |n|
	QuestionTag.create(question_id:questions.sample.id,tag_id:tags.sample.id)
end


