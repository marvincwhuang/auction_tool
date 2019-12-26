Rails.application.routes.draw do
  devise_for :users
  root to: 'page#index'
  post '/products/:id', to: 'products#update'  
  get '/export_data', to: 'page#export_data', as: :export_data 
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
