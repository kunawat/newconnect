class Post < ActiveRecord::Base
  attr_accessible :content, :created_by
  has_many :comments
  
end