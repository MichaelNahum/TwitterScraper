require 'twitter'

class TweetsController < ApplicationController
  def get_tweets
     twitter = TwitterClient.new
     twitter.get_tweets_for_user(params[:user])
   end
  

  def update_tweets
     twitter = TwitterClient.new
     twitter.update_tweets_for_user(params[:user])
   end

   def index
     twitter = TwitterClient.new
     @tweets = Tweet.all
   end



end

#   def show
#     @tweet = Tweet.find(params[:id])
#   end
#
#   def new
#     @tweet = Tweet.new
#   end
#
#   def create
#     @tweet = Tweet.create(tweet_params)
#     redirect_to @tweet
#   end
#
#   def edit
#     @tweet = Tweet.find(params[:id])
#   end
#
#   def update
#     @tweet = Tweet.find(params[:id])
#
#     if @tweet.update(tweet_params)
#       redirect_to @tweet
#     else
#       render 'edit'
#     end
#   end
#
#   def destroy
#     @tweet = Tweet.find(params[:id])
#     @tweet.destroy
#      redirect_to tweets_path
#   end
#
#   private
#   def tweet_params
#     params.require(:entry).permit(:author, :photo_url, :date_taken)
#   end
# end
