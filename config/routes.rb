Rails.application.routes.draw do

  get "restaurants/new_release" => 'restaurants#new_release', :as => :new_release
  get 'offers/change_category'
  resources :food_items
  resources :categories
  resources :restaurants
  resources :restaurantscategories
  resources :offers


  get 'static_pages/home'
  get 'static_pages/index'
  get 'static_pages/about'
  get 'static_pages/contact'
  root 'static_pages#home'
  #root 'restaurants#new'

  #root to: 'restaurants#new'


  devise_for :users,
  					 :controllers => { :registrations => "users/registrations",
  					 :omniauth_callbacks => 'users/omniauth_callbacks'}

  devise_for :delivery_boys, 
              controllers: 
              {
                sessions: 'delivery_boys/sessions',
                registrations: 'delivery_boys/registrations'
              }

end
