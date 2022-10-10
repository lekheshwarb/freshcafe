Rails.application.routes.draw do
  # get "staff/sign_up", to: ""

  # get "reports/overview", to: "reports#overview"
  get "reports", to: "reports#invoices"

  post "login", to: "sessions#login"
  resources :users
  resources :menu_categories
  resources :menu_items
  resources :orders
  resources :order_items
end
