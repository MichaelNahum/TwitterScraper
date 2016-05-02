class TweetsController < ApplicationController

  def index
    @tweets   = Tweet.all.order(created_at: :desc)
    @accounts = Account.all
  end


  # you don't have any views for the actions below... I'd suggest removing these
  # actions and the corresponding routes.
  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  # this comment below looks to be out of date... it's important to keep your
  # code and comments clean!
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
