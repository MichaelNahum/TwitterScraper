
class AccountsController < ApplicationController

  def index
    @accounts = Account.all
    @tweets   =  Tweet.all.order(created_at: :desc)
    @account  = Account.last
  end

  def show
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.create(account_params)
    new_tweets = TwitterClient.get_tweets(@account.username)
    Tweet.create_with_tweets(new_tweets)
    redirect_to accounts_path
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

  def delete_tweets
    @account = Account.find(params[:id])
    @account.tweets.clear
    redirect_to account_url(@account)
  end

  def refresh
    @account = Account.find(params[:id])
    new_tweets = TwitterClient.get_tweets(@account.username)
    Tweet.create_with_tweets(new_tweets)
    redirect_to account_url(@account)
  end

  def deepen
    @account = Account.find(params[:id])
    new_tweets = TwitterClient.get_more_tweets(@account.username)
    Tweet.create_with_tweets(new_tweets)
    redirect_to account_url(@account)
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
