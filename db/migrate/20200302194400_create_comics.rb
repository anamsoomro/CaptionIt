class CreateComics < ActiveRecord::Migration[6.0]
  def change
    create_table :comics do |t|
      t.string :image_url
      t.integer :user_id
      t.timestamps
    end
  end
end
