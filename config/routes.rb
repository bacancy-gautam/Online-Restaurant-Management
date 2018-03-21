Rails.application.routes.draw do
  
  resources :food_items
  resources :categories

  get 'static_pages/home'
  get 'static_pages/index'
  get 'static_pages/about'

  get 'static_pages/contact'

  root 'static_pages#home'


  
  devise_for :users,
             :controllers => { :registrations => "users/registrations",
             :omniauth_callbacks => 'users/omniauth_callbacks',}


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
