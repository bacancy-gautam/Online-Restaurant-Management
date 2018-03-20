Rails.application.routes.draw do
  get 'food_item/index'

  resources :food_items
  resources :categories
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
