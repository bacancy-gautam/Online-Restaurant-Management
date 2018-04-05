Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/index'
  get 'static_pages/about'
  get 'static_pages/contact'
  get 'static_pages/my_account'
  get 'add_food_to_fav',                to: 'food_items#add_food_to_fav'
  get 'add_restaurant_to_fav',          to: 'restaurants#add_restaurant_to_fav'
  get 'users/edit'
  get 'offers/change_category'
  get 'restaurants/new_release' => 'restaurants#new_release', as: :new_release
  get 'offers/change_category'
  get "/change_city" => "addresses#change_city"
  get 'restaurants/area_wise_restaurants' => 'restaurants#area_wise_restaurants', as: :area
  get 'food_categories/change_category'
  get "/change_city" => "addresses#change_city"
  get :search, controller: :restaurants
  get :location, controller: :restaurants

  resources :charges
  resources :orders
  resources :addresses
  resources :favourites
  resources :master_orders
  resources :offers
  resources :food_items
  resources :categories
  resources :restaurants do
    collection do
      get :restaurant_list
    end
    member do
      get :change_restaurant_status
    end
  end
  resources :food_categories
  resources :reviews
  resources :restaurantscategories
  resources :users, path: 'customers' do
    collection do
      get :role_assign
      get :change_password_edit
      patch :change_password_update     
    end
    member do
      get :change_user_status
      get :profile
      patch :updateprofile
      get :edituser
      patch :assign_role
    end
  end
 
  resources :delivery_boys, path: 'deliveryboys' do
    collection do
      get :change_password_edit
      patch :change_password_update
    end
  end
  devise_for :users, controllers:
              {
                sessions: 'users/sessions',
                registrations: 'users/registrations',
                omniauth_callbacks: 'users/omniauth_callbacks'
              }
  devise_for :delivery_boys, controllers:
              {
                sessions: 'delivery_boys/sessions',
                registrations: 'delivery_boys/registrations'
              }
  # post "add_review", to: 'restaurants#add_review'
end
