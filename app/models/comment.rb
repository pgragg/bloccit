class Comment < ActiveRecord::Base
  belongs_to :post 
  belongs_to :user 
  belongs_to :topic 
  validates :user, presence: true

  default_scope { order('created_at DESC') }


  def user? 
    @comment.user != nil
  end
  
end
