Rails.application.routes.draw do

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root to: "users#index"

  resources :users, only: [:new, :index, :create, :show] do
    resources :ideas, only: [:index, :new, :create, :edit, :update]
  end

  namespace :admin do
    resources :categories
  end



end
