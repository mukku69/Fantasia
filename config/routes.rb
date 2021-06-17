Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  root :to => 'homes#top'
  get '/quit_confirm' => 'users#quit_confirm'

  resources :users, only: [:show, :edit, :update, :destroy] do
   resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  resources :posts, only: [:new, :index, :show, :edit, :create, :destroy, :update] do
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end

  resources :contacts, only: [:new, :create] do
    get :complete, on: :collection
  end

end
