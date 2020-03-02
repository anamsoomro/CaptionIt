class CreateComicTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :comic_topics do |t|
      t.integer :comic_id
      t.integer :topic_id
      t.timestamps
    end
  end
end
