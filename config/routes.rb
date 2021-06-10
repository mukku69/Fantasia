Rails.application.routes.draw do
  devise_for :users

  root :to => 'homes#top'

  resources :posts, only: [:index, :new, :show, :edit, :create, :destroy, :update] do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
end
