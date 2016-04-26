class Tweet < ActiveRecord::Base
  belongs_to :account

  def self.create_with_tweets(tweets)
    tweets.each do |tweet|
      create(username: tweet.user, text: tweet.text, raw_tweet: tweet.attrs.to_json)
    end
  end
end
