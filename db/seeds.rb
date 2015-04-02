require 'faker'
Post.delete_all
Comment.delete_all
User.delete_all #Deleting all your data before a reset is pretty much necessary. 

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



 # Create Posts


 5.times do

   Post.create!(
    user:   users.sample,
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
     
   )
 end
 posts = Post.all
 
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
   email: 'user@gmail.com',
   password: '43214321',
   role: 'user'
 )
 admin = User.last
 admin.skip_reconfirmation!
 admin.update_attributes!(
   email: 'admin@gmail.com',
   password: '43214321',
   role: 'admin'
 )
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Advertisement.count} comments created"
 puts "Created the following users"
 users.each do |user|
  puts "#{user.name}'s role is #{user.role}, email: #{user.email}"
 end 





