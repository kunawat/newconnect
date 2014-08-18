class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
    	t.string   "sender"
      t.string   "recipient"
      t.string   "subject"
      t.text     "content"
      t.string   "sent_status"
      t.string   "recieved_status"
      t.integer  "sender_id"
      t.integer  "reciever_id"
      t.timestamps
    end
  end
end
