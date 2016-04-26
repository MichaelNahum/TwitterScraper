class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text     :text
      t.integer  :tweet_id
      t.integer  :account_id
    end
  end
end
