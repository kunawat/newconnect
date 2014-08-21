class AddMailsattachPaperclip < ActiveRecord::Migration
  def up
  	add_column :emails, :attach_file_name,    :string
      add_column :emails, :attach_content_type, :string
      add_column :emails, :attach_file_size,    :integer
      add_column :emails, :attach_updated_at,   :datetime
  end

  def down
  	 remove_column :emails, :attach_file_name
     remove_column :emails, :attach_content_type
     remove_column :emails, :attach_file_size
     remove_column :emails, :attach_updated_at
  end
end
