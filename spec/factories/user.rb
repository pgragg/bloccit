FactoryGirl.define do
   factory :user do
     name "Douglas Adams"
     sequence(:email, 100) { |n| "person#{n}@example.com" }
     password "helloworld"
     password_confirmation "helloworld"
     confirmed_at Time.now
   end
 end

# We can use the above factory like so: 
# build(:user) # Initialize but do not save
# create(:user) # Build and save to test database
# create(:user, name: 'Other Name') # Try it