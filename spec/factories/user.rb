FactoryGirl.define do
   factory :user do
     name "Douglas Adams"
     sequence(:email, 100) { |n| "person#{n}@example.com" }
     password "helloworld"
     password_confirmation "helloworld"
     confirmed_at Time.now

     factory :user_with_post_and_comment do
     user = create(:user)
     first_name "Admin"
     last_name  "User"
     admin      true

      after(:build) do |user|
         post = user.posts.create(:post)
         user.posts.first.comments.create(:comment)
      end
    end
  end
end

# We can use the above factory like so: 
# build(:user) # Initialize but do not save
# create(:user) # Build and save to test database
# create(:user, name: 'Other Name') # Try it