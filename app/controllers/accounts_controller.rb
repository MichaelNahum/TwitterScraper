
class AccountsController < ApplicationController

  def index
    @accounts = Account.all
    @tweets   =  Tweet.all.order(created_at: :desc)

    # suggest a more descriptive variable name to indicate why you're using the
    # last account specifically
    @account  = Account.last
  end

  def show
    @account = Account.find(params[:id])
  end

  # confusing that this method is the 'update' action when it really creates
  # an account. How does it contrast with teh create action below?
  def update
    @account = Account.create(account_params)

    # this code could be moved into the account model, and you could use an
    # after_create callback (a Rails feature) to ensure it runs anytime
    # an account is created (usually a preferred approach, although this is
    # certainly a fine start).
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
    # I see you following the pattern of using the TwitterClient to get more
    # tweets and then passing the result to the Tweet model... could you just
    # have the twitter client methods handle both steps for you?
    # I'm not 100% suggesting that, it has tradeoffs in terms of re-usability
    # of code, but just posing it as a question...
    new_tweets = TwitterClient.get_more_tweets(@account.username)
    Tweet.create_with_tweets(new_tweets)
    redirect_to account_url(@account)
  end

  # for consitency with the refresh action above, I'd call this refresh_all.
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
