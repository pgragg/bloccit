class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_one :summary, dependent: :destroy 
  belongs_to :user
  belongs_to :topic


  default_scope { order('created_at DESC') }
  scope :ordered_by_reverse_created_at, -> { order('created_at ASC') }
  scope :ordered_by_title,              -> { order('title ASC') }
end



# An ordered_by_title scope.

# An ordered_by_reverse_created_at scope.