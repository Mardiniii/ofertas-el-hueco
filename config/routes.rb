Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'pages#home'
  get 'about_us' => 'pages#about_us'
  get '/storehouses/articles/list_subcategories'
  get 'subcategory_products' => 'admin/subcategories#show_products'


  # devise_scope :user do
  #   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  namespace :admin do
    resources :storehouses
    resources :categories
    resources :subcategories
    resources :user, :controller => "user"
    get 'user_list' => 'user#user_index'
    get 'article_list' => 'user#article_index'
    get 'edit_user' => 'user#edit_user'
    patch 'update_user' => 'user#update_user'
  end

  namespace :storehouses do
  	resources :articles
  end
end
