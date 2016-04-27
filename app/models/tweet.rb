class Tweet < ActiveRecord::Base
  belongs_to :account

  def self.create_with_tweets(tweets)
    tweets.each do |tweet|
      account = Account.find_by(username: tweet.user.screen_name)
      Tweet.create(account_id: account.id, text: tweet.text)
    end
  end
  
end
