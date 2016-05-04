class Tweet < ActiveRecord::Base
  belongs_to :account

  def self.create_with_tweets(tweets)
    tweets.each do |tweet|
      account = Account.find_by(username: tweet.user.screen_name)

      # there's a shorter way to write this using `find_or_create_by()`, which
      # is provided for all AR models.
      if Tweet.find_by(tweet_id: tweet.id)
        next
      else
        Tweet.create(account_id: account.id, text: tweet.text, tweet_id: tweet.id, created_at: tweet.created_at)
      end
    end
  end

end
