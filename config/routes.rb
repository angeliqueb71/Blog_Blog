Rails.application.routes.draw do

  root 'home#index'
  resources :users
  resources :comments
  resources :sessions
     # nest route
    resources :posts do
     resources :comments
   end


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete "/logout" => "sessions#destroy"
  get '/logout' => 'sessions#destroy'
  end
