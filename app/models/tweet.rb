class Tweet < ActiveRecord::Base
  belongs_to :account

  def self.create_with_tweets(tweets)
    tweets.each do |tweet|
      account = Account.find_by(username: tweet.user.screen_name)

      if Tweet.find_by(tweet_id: tweet.id)
        next
      else
        Tweet.create(account_id: account.id, text: tweet.text, tweet_id: tweet.id, created_at: tweet.created_at)
      end
    end
  end

end
