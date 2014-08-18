class CreatePollOptions < ActiveRecord::Migration
  def change
    create_table :poll_options do |t|
      t.integer "poll_id"
      t.string "keyword"
      t.integer "votes", :default => 0 	
      t.timestamps
    end
  end
end
