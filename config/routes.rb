Rails.application.routes.draw do
  resources :users
  resources :menu_categories
  resources :menu_items
end
