Rails.application.routes.draw do
  devise_for :users

  root :to => 'homes#top'

  resources :users, only: [:show, :edit, :update]

  resources :posts, only: [:new, :index, :show, :edit, :create, :destroy, :update] do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
end
