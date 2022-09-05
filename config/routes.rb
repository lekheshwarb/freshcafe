Rails.application.routes.draw do
  resources :users
  resources :menu_categories
  resources :menu_items
  resources :orders
  resources :order_items
end
