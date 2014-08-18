class AddPollidToPollusers < ActiveRecord::Migration
  def change
  	add_column :poll_users, :poll_id, :integer
  end
end
