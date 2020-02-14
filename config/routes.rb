Rails.application.routes.draw do
  root 'users#home'
  devise_for :users
  resources :houses
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
