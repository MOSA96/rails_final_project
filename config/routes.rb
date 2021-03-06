Rails.application.routes.draw do
  get 'sessions/new'
  #get 'users/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root "stocks#index"
  #get "/stocks", to: "stocks#index"
  
  #Sing up
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/market', to: 'static_pages#market'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/buy', to: "transaction#buy", as: :buy
  post '/sell', to: "transaction#sell", as: :sell
  delete '/logout', to: 'sessions#destroy'
  
  shallow do 
    resources :users
      resources :transactions
  end
  
  resources :users
  resources :transactions
  resources :account_activations, only: [:edit]

  
end
