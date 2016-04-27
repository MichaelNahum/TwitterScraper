
class AccountsController < ApplicationController

  def index
    @accounts = Account.all
    @tweets   = Tweet.all
  end

  def show
    @account = Account.find(params[:id])
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.create(account_params)
    redirect_to @account
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    redirect_to accounts_path
  end

  def refresh
    @account = Account.find(params[:id])
    new_tweets = TwitterClient.get_tweets(@account.username)
    Tweet.create_with_tweets(new_tweets)
    redirect_to account_path
  end

  def get_more
    @account = Account.find(params[:id])
    latest_tweet_id = @account.tweets
    if latest_tweet_id == 1
    end
  end

  def update_all
    Account.all.each do |account|
      new_tweets = TwitterClient.get_tweets(account.username)
      Tweet.create_with_tweets(new_tweets)
    end
    redirect_to accounts_path
  end

private
def account_params
    params.require(:account).permit(:username)
end

end



# 'twitter' gem documentation:

# Fetch the timeline of Tweets by a user:
# client.user_timeline("gem")
# client.user_timeline(213747670)

# Fetch a user (by screen name or user ID)
# client.user("gem")
# client.user(213747670)

# def get_account
#   twitter = TwitterClient.new
#   twitter.user(params[:user])
# end
