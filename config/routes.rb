Rails.application.routes.draw do
  devise_for :users
  
  root 'pages#home'

  namespace :admin do
    resources :storehouses
    resources :user, :controller => "user"  
  end  

  namespace :storehouses do
  	resources :articles
  end  
end
