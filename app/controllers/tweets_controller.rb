class TweetsController < ApplicationController

  def index
    @tweets   = Tweet.all.order(:created_at)
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


  private
  def account_params
      params.require(:account).permit(:username)
  end

end
