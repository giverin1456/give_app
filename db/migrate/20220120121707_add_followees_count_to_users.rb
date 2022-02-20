class AddFolloweesCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :followees_count, :integer, :default => 0
  end
end
