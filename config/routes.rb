Rails.application.routes.draw do

 root 'accounts#index'

 resources :accounts  do
    get "update_all", on: :collection
    get "refresh", on: :member
    get "deepen", on: :member
  end

 resources :tweets


end
