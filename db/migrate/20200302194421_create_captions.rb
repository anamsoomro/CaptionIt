class CreateCaptions < ActiveRecord::Migration[6.0]
  def change
    create_table :captions do |t|
      t.string :text
      t.integer :user_id
      t.integer :comic_id
      t.timestamps
    end
  end
end
