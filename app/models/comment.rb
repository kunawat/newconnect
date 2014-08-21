class Comment < ActiveRecord::Base
 attr_accessible :post_id, :content, :created_by
end