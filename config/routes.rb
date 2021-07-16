Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  post 'guest_sign_in' => 'sessions#guest_sign_in'

  root :to => 'homes#top'
  get '/quit_confirm' => 'users#quit_confirm'

  resources :users, only: [:show, :edit, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  resources :posts, only: [:new, :index, :show, :edit, :create, :destroy, :update] do
    resources :comments, only: [:index, :create, :destroy]
    resource :likes, only: [:create, :destroy]
    get :search, on: :collection
  end

  resources :contacts, only: [:new, :create] do
    get :complete, on: :collection
  end

  resources :chats, only: [:show, :create]

end
