FactoryGirl.define do
   factory :comment do
     body "This is a new comment."
     user
     post
 
     after(:build) do |comment|
       comment.class.skip_callback(:create, :after, :send_favorite_emails)
     end
   end
 end

 # This code is run after the comment is initialized and before it's saved. 
 # This allows us the same opportunity to stub after-create 
 # behavior that we took advantage of in our manual factory.