require 'twitter'

class TwitterClient < ActiveRecord::Base
  # accesses the Twitter API whenever an instance of TwitterClient is created.
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = 'tUFYHKytPm9bJHEfFvc50Gzkg'
      config.consumer_secret     = 'BNQPDTzcPhAY4psGckJRt5Nd4bHxorvmIEAo7YLdB4ZUSmB9DS'
      config.access_token        = '1625578152-1wsOUgo62U2cBOaEegmAupnmxoHn9DKS74hfxkZ'
      config.access_token_secret = 'xS8pInfwVpGsyLDJnZid92bOQ3F2bxY8sJ8xpTu76lvSL'
    end

    def get_tweets(username, opts={})
      @client.user_timeline(username, opts)
    end

    def get_account(username)
      @client.user(username)
    end

      #gets twitter_user's most recent 200 tweets
      new_tweets = get_tweets(twitter_user, {since_id: latest_tweet_id, count: 200})

  end
end
