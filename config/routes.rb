Rails.application.routes.draw do

  root to: 'sessions#new'

  get '/', to: "sessions#new"
  post '/', to: "sessions#create"

  resources :users, only: [:new, :create, :show]
end
