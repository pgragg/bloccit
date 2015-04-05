class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_one :summary, dependent: :destroy 
  belongs_to :user
  belongs_to :topic

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true


  default_scope { order('created_at DESC') }
  scope :ordered_by_reverse_created_at, -> { order('created_at ASC') }
  scope :ordered_by_title,              -> { order('title ASC') }
end



#There are numerous types of validations. The most common are presence, length, and format. Formatting usually requires a Regex, which is an advanced topic that will be covered later. Here's the Rails Guide on validations - it's a good reference.