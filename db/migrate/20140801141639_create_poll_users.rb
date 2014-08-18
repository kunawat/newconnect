class CreatePollUsers < ActiveRecord::Migration
  def change
    create_table :poll_users do |t|
      t.integer "user_id"	
      t.timestamps
    end
  end
end
