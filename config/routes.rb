Rails.application.routes.draw do
  
  resources :food_items
  resources :categories
  resources :restaurants

  get 'static_pages/home'
  get 'static_pages/index'
  get 'static_pages/about'
  get 'static_pages/contact'
  root 'static_pages#home'



  devise_for :users,
  					 :controllers => { :registrations => "users/registrations",
  					 :omniauth_callbacks => 'users/omniauth_callbacks'}

end
