class PollUser < ActiveRecord::Base
   attr_accessible :poll_id, :user_id
  # attr_accessible :title, :body
end
