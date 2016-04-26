Rails.application.routes.draw do

 root 'accounts#index'

 resources :accounts do
    resources :tweets
  end

end
