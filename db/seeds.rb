require 'faker'
Post.delete_all
Comment.delete_all
User.delete_all #Deleting all your data before a reset is pretty much necessary. 
Topic.delete_all 
Summary.delete_all
 #Posts creation assignment 


a = Advertisement.find_or_create_by(title: 'You gotta buy dis nao', copy: 'Unique AD Copy!', price: 450)
 

 # Create Users
 5.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
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

 # Create Topics
 15.times do
   Topic.create!(
     name:         Faker::Lorem.sentence,
     description:  Faker::Lorem.paragraph
   )
 end
 topics = Topic.all

 # Create Posts


 50.times do

   Post.create!(
    user:   users.sample,
    topic: topics.sample,
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph
     
   )
 end
 posts = Post.all

  51.times do

   Summary.create!(
    post:   posts.sample,
    title:  Faker::Lorem.sentence,  
   )
 end
 summaries = Summary.all
 
 # Create Comments
 10.times do
   Comment.create!(
     user: users.sample,
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end

 me = User.first
 me.skip_reconfirmation!
 me.update_attributes!(
   email: 'user@example.com',
   password: 'helloworld',
   role: 'user'
 )
admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 admin.skip_confirmation!
 admin.save!
 
 # Create a moderator
 moderator = User.new(
   name:     'Moderator User',
   email:    'moderator@example.com',
   password: 'helloworld',
   role:     'moderator'
 )
 moderator.skip_confirmation!
 moderator.save!
 
 # Create a member
 member = User.new(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld'
 )
 member.skip_confirmation!
 member.save!

 population = User.all
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Advertisement.count} ads created"
 puts "Created the following users"
 population.each do |user|
  print "#{user.name}'s email: #{user.email}."
  if user.role != nil 
    print "(**#{user.role}**)"
  end 
  puts ""
 end 





