class AddLikersCountToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :likers_count, :integer, default: 0
  end
end
