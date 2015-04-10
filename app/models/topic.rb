class Topic < ActiveRecord::Base
  has_many :posts
  validates :name, length: { minimum: 5 }, presence: true
  mount_uploader :image, ImageUploader
end
