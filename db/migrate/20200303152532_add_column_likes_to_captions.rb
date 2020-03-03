class AddColumnLikesToCaptions < ActiveRecord::Migration[6.0]
  def change
    add_column :captions, :likes, :integer
  end
end
