Rails.application.routes.draw do

  root 'cafes#index'

  resources :cafes, only: [:index, :show] do
    resources :menu_items, only: [:destroy, :create, :update]
    resources :coffee_gifts, only: [:new, :create]
  end

  get '/login' => 'user_sessions#new'
  post '/users/sessions' => 'user_sessions#create'
  delete '/logout' => 'user_sessions#destroy'
  get '/profile' => 'users#show'
  get '/register' => 'users#new'
  get '/cafes/login' => 'cafe_sessions#new'
  post '/cafes/sessions' => 'cafe_sessions#create'
  delete '/cafes/logout' => 'cafe_sessions#destroy'
  get '/cafes/profile' => 'cafes#show'

  resources :users, only: [:create]
  resources :coffee_gifts, only: [:show]

end
