Rails.application.routes.draw do
  
  resources :food_items
  resources :categories
  devise_for :users
  root 'food_items#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
