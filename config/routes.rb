Rails.application.routes.draw do
  resources :vending_machine_stocks
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'application#hello'

  resources :products

  get '/vending_machines', to: 'vending_machines#index'
  get '/vending_machines/collect_revenue', to: 'vending_machines#collect_revenue'
end
