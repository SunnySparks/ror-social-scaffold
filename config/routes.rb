Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users
  devise_for :friendships

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
  
  resources :friendships, only: [:index, :create, :update, :destroy]
  get 'accept/:id', to: 'friendships#accept', as: :accept

end
