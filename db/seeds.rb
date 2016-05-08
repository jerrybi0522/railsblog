# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = []

20.times do 
	users << User.create(username: Faker::Internet.user_name, fname: Faker::Name.first_name, lname: Faker::Name.last_name, password: "12345", birthday: 1/3/1994, email: Faker::Internet.email)
	
end

posts = []

users.each do |user|

	3.times do
		posts << Post.create(user_id: user.id, title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph)
	end

end

users.each do |user|

	3.times do
		Comment.create(user_id: user.id, post_id: posts.sample.id, body: Faker::Lorem.paragraph)
	end
	
end