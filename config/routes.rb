Rails.application.routes.draw do
  root 'users#home'
  devise_for :users
  resources :houses
  # resources :posts
  resources :addresses
  resources :users, only: :index
  get "/addresses/new/:id" => "addresses#new", as: :address_new
  get "/addresses/create/:id" => "addresses#create", as: :address_create
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
