Rails.application.routes.draw do

  get "restaurants/new_release" => 'restaurants#new_release', :as => :new_release
  resources :orders
  resources :master_orders

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "restaurants/new_release" => 'restaurants#new_release', :as => :new_release
  get 'offers/change_category'
  resources :food_items
  resources :categories
  resources :restaurants
  resources :restaurantscategories


  get :search, controller: :restaurants
  get :location, controller: :restaurants
  

  resources :offers

  get 'static_pages/home'
  get 'static_pages/index'
  get 'static_pages/about'
  get 'static_pages/contact'
  root 'static_pages#home'
  #root 'restaurants#new'

  #root to: 'restaurants#new'
  
  resources :delivery_boys, :path => 'deliveryboys' do
    collection do
      get :change_password_edit
      patch :change_password_update
    end
  end

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
