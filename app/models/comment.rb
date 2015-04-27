class Comment < ActiveRecord::Base
  belongs_to :post 
  belongs_to :user 
  belongs_to :topic 
  #validates :user, presence: true

  default_scope { order('created_at DESC') }

  after_create :send_favorite_emails
  
  def user? 
    @comment.user != nil
  end
 
   private
 
   def send_favorite_emails
     post.favorites.each do |favorite|
       FavoriteMailer.new_comment(favorite.user, post, self).deliver_now
     end
   end

  
  
end
