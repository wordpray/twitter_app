class AddColumnToTweet < ActiveRecord::Migration[5.0]
  def change
    add_column :tweets, :reply_nickname, :string
    add_column :tweets, :reply_tweet, :integer
  end
end
