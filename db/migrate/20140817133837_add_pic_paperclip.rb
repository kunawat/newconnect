class AddPicPaperclip < ActiveRecord::Migration
  def up
  	add_column :doc_users, :pic_file_name,    :string
     add_column :doc_users, :pic_content_type, :string
      add_column :doc_users, :pic_file_size,    :integer
      add_column :doc_users, :pic_updated_at,   :datetime
  end

  def down
  	 remove_column :doc_users, :pic_file_name
    remove_column :doc_users, :pic_content_type
     remove_column :doc_users, :pic_file_size
     remove_column :doc_users, :pic_updated_at
  end
end
