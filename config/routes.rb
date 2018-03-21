Rails.application.routes.draw do
  

  get 'admin' => 'admin#index', :as => :admin_index

  resources :food_items
  resources :categories
  resources :restaurants
  resources :restaurantscategories

  get 'static_pages/home'
  get 'static_pages/index'
  get 'static_pages/about'
  get 'static_pages/contact'
  root 'static_pages#home'

  devise_for :users,
  					 :controllers => { :registrations => "users/registrations",
  					 :omniauth_callbacks => 'users/omniauth_callbacks'}
end
