require 'twitter'

class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
    @accounts = Account.all
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create #requires API call, right?
    @tweet = Tweet.create(params[:id])
    redirect_to @tweet
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to accounts_path
  end

end






  #  def get_tweets
  #    t = TwitterClient.new
  #    t.get_tweets_for_user(params[:user])
  #  end

#
#
#
#   private
#   def tweet_params
#     params.require(:entry).permit(:author, :photo_url, :date_taken)
#   end
# end
