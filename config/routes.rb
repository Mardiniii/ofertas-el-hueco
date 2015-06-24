Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'pages#home'
  get 'about_us' => 'pages#about_us'
  get 'stores' => 'pages#stores'
  get '/storehouses/articles/list_subcategories'
  get 'subcategory_products' => 'admin/subcategories#show_products'
  get 'favoritos', to: 'whishlist_items#index'
  get "/storehouses/favorite_articles"
  get "/storehouses/favorite_clients"

  resources :whishlist_items do
    get 'create', to: 'whishlist_items#create'
  end


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
    resources :articles do
      get "bindstore", to: "articles#bindstore",  as: "bindstore"
    end
  end

  resources :storehouses do
    get 'subcategories_list', on: :member
  end
end

# http://localhost:3000/storehouses/json/1.json
# http://localhost:3000/storehouses/article/json/1.json
