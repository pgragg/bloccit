class PostPolicy < ApplicationPolicy
  def index? 
    @posts = policy_scope(Post.scoped)
  end

  def create? 
    user.present? 
  end 

  def destroy?
    user.present? && (record.user == user || user.admin? || user.moderator?)
  end 

  class Scope < Scope 
    def resolve 
    unless user == nil 
      if user.admin? 
        scope.all 
      else 
        scope.where(:user_id => user.id)
      end 
    end 
    end 
  end 
end 



# Sign in as an admin user, and you should see all posts.