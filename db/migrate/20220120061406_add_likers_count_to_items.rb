class AddLikersCountToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :likers_count, :integer, default: 0
  end
end
