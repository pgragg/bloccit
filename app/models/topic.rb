class Topic < ActiveRecord::Base
  include ViewHelper
  has_many :posts, dependent: :destroy 
  validates :name, length: { minimum: 5 }, presence: true
  mount_uploader :image, ImageUploader

  scope :visible_to, -> (user) { user ? all : where(public: true) } 
  # Calling the scope invokes the result of its lambda on the collection 
  # or class on which it was originally called. 
  # So this scope returns the equivalent of topic_collection.all 
  # or topic_collection.where(public: true), depending on the value of user.
end
