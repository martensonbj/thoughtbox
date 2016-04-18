Rails.application.routes.draw do

  root 'home#index'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show]
  resources :links, only: [:index, :new, :create]

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      resources :links, defaults: {format: :json}
    end
  end
  
end
