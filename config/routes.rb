Rails.application.routes.draw do
  root 'home#index'
  get 'about', to: 'about#index'

  resource :users, only: [:show, :edit, :update, :destroy] do
    resource :sign_up, controller: 'users/sign_up', only: [:show, :create]
    resource :sign_in, controller: 'users/sign_in', only: [:show, :create]
    resource :sign_out, controller: 'users/sign_out', only: [:destroy]
    resources :posts, controller: 'users/posts'
    resources :categories, controller: 'users/categories'
    resources :tags, controller: 'users/tags', only: [:index, :create, :new]
    get 'tag/list', to: 'users/tags#list'
  end

  namespace :blog do
    resources :posts, only: [:index, :show]
    resources :categories, only: [:show]
    resources :tags, only: [:show]
  end
end
