# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Removing data'
Mark.destroy_all
Comment.destroy_all
Post.destroy_all
User.destroy_all

puts 'Creating users'
users_data = 10.times.map do
  {
    email: FFaker::Internet.email,
    name: FFaker::Internet.user_name[0...16]
  }
end

users = User.create! users_data

creators = User.first(7).each{ |user| user.update creator: true }
moderators = User.first(2).each{ |user| user.update moderator: true }

puts 'Creating posts'
posts_data = 100.times.map do
  {
    user: creators.sample,
    title: FFaker::Lorem.paragraph[0...100],
    body: FFaker::Lorem.paragraphs.join[0...5_000]
  }
end

posts = Post.create! posts_data

puts 'Creating comments'
comments_data = 300.times.map do
  {
    user: users.sample,
    commentable: [users.to_a, posts.to_a].flatten.sample,
    body: FFaker::Lorem.paragraphs.join[0...500]
  }
end

Comment.create! comments_data

puts 'Creating marks'
users.each do |user|
  posts.sample(rand(0..10)) do |post|
    Mark.create! user: user, post: post, value: rand(1..5)
  end
end