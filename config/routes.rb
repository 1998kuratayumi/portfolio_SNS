Rails.application.routes.draw do
  get 'favorites/index'

  get 'users/show'
  root :to =>"homes#top"
  get 'homes/about'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :posts, only: [:new, :create, :show, :destroy, :edit] do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :notifications, only: :index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
