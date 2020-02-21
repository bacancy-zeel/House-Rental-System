Rails.application.routes.draw do
  root 'users#home'
  devise_for :users
  resources :houses
  # resources :posts
  # resources :addresses
  resources :users, only: :index
  resources :cities, only: :index
  get "users/show/:id" => "users#show", as: :show_user
  get "/addresses/new/:id" => "addresses#new", as: :new_address
  post "/addresses/create/:id" => "addresses#create", as: :create_address
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
