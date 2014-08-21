class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text "content"
      t.string "created_by"			
      t.timestamps
    end
  end
end