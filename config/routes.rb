Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tweets, only: [:index, :new, :create, :destroy]
  resources :users, only: [:show] do
    resources :followers, only: [:create, :destroy]
  end

  root 'home#index'
end
