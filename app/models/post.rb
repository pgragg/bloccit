class Post < ActiveRecord::Base
  attr_accessor :name 
  has_many :comments
  belongs_to :user

  default_scope { order('created_at DESC') }
end
