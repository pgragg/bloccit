class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :favorites, dependent: :destroy 
  has_many :posts, dependent: :destroy  
  has_many :votes, dependent: :destroy 
  has_many :comments, dependent: :destroy  
  mount_uploader :avatar, AvatarUploader
  
  def admin? 
    role == 'admin'
  end

  def moderator?
    role = 'moderator'
  end
  def favorited(post)
    favorites.where(post_id: post.id).first
  end
  def voted(post)
    votes.where(post_id: post.id).first 
     #  Like the favorited method, voted should return whether the user has any votes 
     #for the post. If yes, it should return the vote; if not, nil:
   end
   
   def self.top_rated
     self.select('users.*') # Select all attributes of the user
         .select('COUNT(DISTINCT comments.id) AS comments_count') # Count the comments made by the user
         .select('COUNT(DISTINCT posts.id) AS posts_count') # Count the posts made by the user
         .select('COUNT(DISTINCT comments.id) + COUNT(DISTINCT posts.id) AS rank') # Add the comment count to the post count and label the sum as "rank"
         .joins(:posts) # Ties the posts table to the users table, via the user_id
         .joins(:comments) # Ties the comments table to the users table, via the user_id
         .group('users.id') # Instructs the database to group the results so that each user will be returned in a distinct row
         .order('rank DESC') # Instructs the database to order the results in descending order, by the rank that we created in this query. (rank = comment count + post count)
   end
end
