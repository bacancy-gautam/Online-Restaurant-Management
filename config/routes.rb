Rails.application.routes.draw do

  root 'static_pages#home'

  get 'static_pages/home'
  get 'static_pages/index'
  get 'static_pages/about'
  get 'static_pages/contact'
  get 'users/edit'
  get 'offers/change_category'
  get "restaurants/new_release" => 'restaurants#new_release', :as => :new_release
  get :search, controller: :restaurants
  get :location, controller: :restaurants

  resources :orders
  resources :master_orders
  resources :offers
  resources :food_items
  resources :categories
  resources :restaurants
  resources :restaurantscategories

  resources :users, :path => 'customers' do
    collection do
      get :change_password_edit
      patch :change_password_update
    end
  end
  
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
