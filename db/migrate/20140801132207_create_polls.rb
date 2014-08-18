class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.integer "created_by"
      t.text "question"
      t.date "end_date"
      t.boolean "state"
      t.timestamps
    end
  end
end
