 require 'faker'


 #Posts creation assignment 

p = Post.find_or_create_by(title: 'Unique Post Title', body: 'Unique post body!')
a = Advertisement.find_or_create_by(title: 'You gotta buy dis nao', copy: 'Unique AD Copy!', price: 450)
 
 # Create Posts




 50.times do
   Post.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 posts = Post.all
 
 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"