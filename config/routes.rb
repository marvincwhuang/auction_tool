Rails.application.routes.draw do
  devise_for :users
  root to: 'page#index'
  post '/products/:id', to: 'products#update'  

  resources :templates
  resources :brands do
    resources :services
    resources :products do
      get '/templates/copy', to: 'templates#copy'
      resources :templates
      resources :services
    end
  end
end
