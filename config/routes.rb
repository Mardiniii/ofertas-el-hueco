Rails.application.routes.draw do
  devise_for :users
  
  root 'pages#home'
  resources :storehouses
  resources :user, :controller => "user"
end
