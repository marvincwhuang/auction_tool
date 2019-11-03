Rails.application.routes.draw do
  resources :services
  root to: 'page#index'
  post '/products/:id', to: 'products#update'

  resources :products
  resources :brands

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
