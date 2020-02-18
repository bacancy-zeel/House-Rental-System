Rails.application.routes.draw do
  root 'users#home'
  devise_for :users
  resources :houses
  resources :posts
  # resources :addresses
  resources :cities, only: :index

  # post "cities" => "houses#cities"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
