Rails.application.routes.draw do

 root 'tweets#index'

 resources :accounts do
    resources :tweets
  end

end
