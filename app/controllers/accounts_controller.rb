require 'twitter'

class AccountsController < ApplicationController

  def get_accounts
    twitter = TwitterClient.new
    twitter.get_accounts_for_user(params[:user])
  end

  def update_accounts
    twitter = TwitterClient.new
    twitter.get_accounts_for_user(params[:user])
  end

  def index
    @accounts = Account.all
  end



end
