# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

#main user
User.create!(
  f_name:   "Captain",
  l_name:   "Blackbeard",
  email:    "cpt.blackbeard@example.com",
  city:     Faker::Address.city,
  country:  Faker::Address.country,
  twitter:  "@cptBlackbeard",
  password: "password",
  password_confirmation: "password"

)
# => create 50 dummy users
50.times do |n|
  first_name  = Faker::Name.first_name
  last_name  = Faker::Name.last_name
  email   = "dummy-#{n+1}@example.com"
  User.create(
    f_name:   first_name,
    l_name:   last_name,
    email:    email,
    city:     Faker::Address.city,
    country:  Faker::Address.country,
    twitter:  "@#{last_name + first_name}",
    password: "password",
    password_confirmation: "password"
  )
end

# => create dummy stories
users = User.order(:created_at).take(10)
5.times do
  paragraph_count = rand(10..100)
  tags = Faker::Lorem.words(5)
  tags = "\##{tags.join('\#')}"
  users.each do |u|
    story = u.stories.create!(
      title:    Faker::Lorem.sentence(rand(3..10)).chomp('.'),
      subtitle: Faker::Lorem.sentence(rand(5..12)).chomp('.'),
      content:   Faker::Lorem.paragraphs(paragraph_count).join("\n\n"),
      tags:     tags
    )

    #create comments for the story created
    10.times do |n|
      comment = Faker::Hipster.sentence(rand(3..10))
        story.comments.create!(
          content: comment,
          user_id: n+2  #skip the story author for commenter
        )
    end #comment loop

  end #user each loop
end

# => likes
stories = Story.all
users = User.order("created_at DESC").take(20)
10.times do
  stories.each do |story|
    story.upvote_by users[rand(1..15)]
  end
end

# => following relationship
# users = User.all
# user = users.first
# following = users[2..10]
# followers = users[3..30]
# following.each { |followed| user.follow(followed) }
# followers.each { |follower| follower.follow(user) }
