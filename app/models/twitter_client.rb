require 'twitter'

class TwitterClient
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = 'tUFYHKytPm9bJHEfFvc50Gzkg'
      config.consumer_secret     = 'BNQPDTzcPhAY4psGckJRt5Nd4bHxorvmIEAo7YLdB4ZUSmB9DS'
      config.access_token        = '1625578152-1wsOUgo62U2cBOaEegmAupnmxoHn9DKS74hfxkZ'
      config.access_token_secret = 'xS8pInfwVpGsyLDJnZid92bOQ3F2bxY8sJ8xpTu76lvSL'
    end
  end

  def get_tweets(username)
    @client.user_timeline(username)
  end

  def get_account(username)
    @client.user(username)
  end

end


# gets twitter_user's most recent 200 tweets
# new_tweets = get_tweets(twitter_user, {since_id: latest_tweet_id, count: 200})

# 'twitter' gem documentation:

# Fetch the timeline of Tweets by a user:
# client.user_timeline("gem")
# client.user_timeline(213747670)

# Fetch a user (by screen name or user ID)
# client.user("gem")
# client.user(213747670)