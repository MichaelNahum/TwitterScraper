Rails.application.routes.draw do

 root 'accounts#index'

 resources :accounts  do
    get "update_all", on: :collection
    get "refresh", on: :member
    get "deepen", on: :member
    patch "delete_tweets", on: :member
  end

  # it looks like the only RESTful route you have for tweets is the index...
  # I'd suggest updating your routes to clearly indicate that:
  # resources :tweets, only: [:index]
 resources :tweets


end
