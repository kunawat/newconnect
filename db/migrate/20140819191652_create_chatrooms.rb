class CreateChatrooms < ActiveRecord::Migration
  def change
    create_table :chatrooms do |t|
    	t.string :name
         
    	 t.text :content
      t.timestamps
    end
  end
end
