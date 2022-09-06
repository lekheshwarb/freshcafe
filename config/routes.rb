Rails.application.routes.draw do
  get "reports/overview", to: "reports#overview"
  get "reports/invoices", to: "reports#invoices"

  resources :users
  resources :menu_categories
  resources :menu_items
  resources :orders
  resources :order_items
end
