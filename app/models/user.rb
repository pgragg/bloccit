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
end
