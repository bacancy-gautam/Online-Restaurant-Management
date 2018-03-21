Rails.application.routes.draw do
  
<<<<<<< HEAD
=======

  get 'admin' => 'admin#index', :as => :admin_index

>>>>>>> admin panel phase-1 complete in branch vishal-admin-site-layout
  resources :food_items
  resources :categories
  resources :restaurants


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'static_pages/home'
  get 'static_pages/index'
  get 'static_pages/about'
  get 'static_pages/contact'
  get 'users/edit'
  root 'static_pages#home'
  get "restaurants/new_release" => 'restaurants#new_release', :as => :new_release
  resources :orders
  resources :master_orders

 
  get 'offers/change_category'
  resources :food_items
  resources :categories
  resources :restaurants
  resources :restaurantscategories
  resources :offers

  resources :users, :path => 'customers' do
    collection do
      get :change_password_edit
      patch :change_password_update
    end
  end
 
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
