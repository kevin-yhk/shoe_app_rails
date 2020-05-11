Rails.application.routes.draw do
  
  root 'sessions#home'
  
  resources :shoes do 
    resources :reviews
  end 

  resources :users

  get '/signup', to:'users#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#facebook'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
