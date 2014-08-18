class Message < ActiveRecord::Base
  attr_accessible :content, :name

  validates :content, presence: true

  belongs_to :receiver, :class_name=> "User", :foreign_key=>"receiver_id"
end
