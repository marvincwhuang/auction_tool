Rails.application.routes.draw do
  root to: 'page#index'
  post '/products/:id', to: 'products#update'  

  resources :products do
    resources :templates
    get '/templates/copy', to: 'templates#copy'
  end
  resources :brands
  resources :services
  resources :templates
end
