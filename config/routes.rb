Rails.application.routes.draw do

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root to: "users#index"
  resources :users, only: [:new, :index, :create, :show]

  namespace :admin do
    resources :categories, only: [:index, :new, :create]
  end

end
