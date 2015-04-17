class Topic < ActiveRecord::Base
  include ViewHelper
  has_many :posts, dependent: :destroy 
  validates :name, length: { minimum: 5 }, presence: true
  mount_uploader :image, ImageUploader
end
