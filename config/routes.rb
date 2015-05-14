Rails.application.routes.draw do
  devise_for :users
  
  root 'pages#home'

  get 'about_us' => 'pages#about_us'

  namespace :admin do
    resources :storehouses
    resources :user, :controller => "user"  
  end  

  namespace :storehouses do
  	resources :articles
  end  
end
