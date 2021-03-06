# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#home'
  devise_for :users
  resources :houses do
    resources :addresses
  end
  resources :users, only: %i[index edit update]
  resources :cities, only: :index

  get 'users/not_approved' => 'users#not_approved', as: :not_approved
  get 'users/reserve_approval' => 'users#reserve_approval',
      as: :reserve_approval
  # get 'users/search' => 'users#search', as: :search
  get 'users/show_house/:id' => 'users#show_house', as: :show_house # user_id

  patch '/houses/approval_update/:house_id' => 'houses#approval_update',
        as: :approval_update
  patch '/houses/reserve_update/:house_id' => 'houses#reserve_update',
        as: :reserve_update
  # For details on the DSL available within this file, see
  # https://guides.rubyonrails.org/routing.html
end
