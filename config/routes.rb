Rails.application.routes.draw do
  root to: 'page#index'
  post '/products/:id', to: 'products#update'
  get '/products/:id/new_yahoo_html', to: 'products#new_yahoo_html'
  get '/products/:id/show_yahoo_html', to: 'products#show_yahoo_html'
  get '/products/:id/edit_yahoo_html', to: 'products#edit_yahoo_html'
  post '/products/:id/create_yahoo_html', to: 'products#create_yahoo_html'
  patch '/products/:id/update_yahoo_html', to: 'products#update_yahoo_html'

  resources :products
  resources :brands
  resources :services
end
