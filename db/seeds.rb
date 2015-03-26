 require 'faker'
Post.delete_all
Comment.delete_all

 #Posts creation assignment 

p = Post.find_or_create_by(title: 'Unique Post Title', body: 'Unique post body!')
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

 user = User.first
 user.skip_reconfirmation!
 user.update_attributes!(
   email: 'pipergragg@gmail.com',
   password: '43214321'
 )
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Advertisement.count} comments created"