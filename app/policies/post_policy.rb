class PostPolicy < ApplicationPolicy
  def index? 
    true
  end
end 



# Sign in as a normal user, and you should only see the posts you've created.

# Sign in as an admin user, and you should see all posts.