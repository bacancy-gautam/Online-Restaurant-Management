Rails.application.routes.draw do
  
  get "food_items/new_release" => 'food_items#new_release', :as => :new_release

  resources :food_items
  resources :categories
  resources :restaurants
  resources :restaurantscategories

  get 'static_pages/home'
  get 'static_pages/index'
  get 'static_pages/about'
  get 'static_pages/contact'

  root 'food_items#index'

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
