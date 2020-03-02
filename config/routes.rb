Rails.application.routes.draw do
  root 'users#home'
  devise_for :users
  resources :houses
  # resources :posts
  # resources :addresses
  resources :users, only: [:index, :edit, :update]
  resources :cities, only: :index
  get "users/approval" => "users#approval", as: :approval
  get "users/search" => "users#search", as: :search
  get "users/show/:id" => "users#show", as: :show_user
  get "/addresses/new/:house_id" => "addresses#new", as: :new_address
  post "/addresses/create/:house_id" => "addresses#create", as: :create_address
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
