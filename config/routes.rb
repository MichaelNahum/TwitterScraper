Rails.application.routes.draw do

 root 'welcome#index'

 resources :accounts do
    resources :tweets
  end

end
