class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "username", :limit => 16
      t.string "first_name"
      t.string "last_name"
      t.string "hashed_password"
      t.string "linked_in"
      t.date "date_of_birth"
      t.string "gender", :limit => 10
      t.text "about_me", :limit => 50 
      t.string "contact_no", :limit => 10
      t.string "email", :limit => 30	
     
      t.timestamps    end
  end
end
