class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    	 t.string :name
       	 t.integer "receiver_id"	
    	 t.text :content

      t.timestamps

    end
        	add_index("messages", "receiver_id")
  end
end
