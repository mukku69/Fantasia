Rails.application.routes.draw do
  devise_for :users

  root :to => 'homes#top'
  get '/quit_confirm' => 'users#quit_confirm'

  resources :users, only: [:show, :edit, :update, :destroy]

  resources :posts, only: [:new, :index, :show, :edit, :create, :destroy, :update] do
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
end
