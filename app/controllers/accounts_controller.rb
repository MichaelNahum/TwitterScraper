require 'twitter'

class AccountsController < ApplicationController

  def index
    @accounts = Account.all
    @tweets = Tweet.all
  end

  def show
    @account = Account.find(params[:id])
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.create(params[:id])
    redirect_to @account
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    redirect_to accounts_path
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
