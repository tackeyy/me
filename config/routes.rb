Rails.application.routes.draw do
  get 'dashboad/index'

  root 'home#index'
  get 'about', to: 'about#index'

  get 'dashboad', to: 'dashboad#index'
  resource :users, only: [:edit, :update, :destroy] do
    resource :sign_up, controller: 'users/sign_up', only: [:show, :create]
    resource :sign_in, controller: 'users/sign_in', only: [:show, :create]
    resource :sign_out, controller: 'users/sign_out', only: [:destroy]
    resources :posts, controller: 'users/posts'
    resources :categories, controller: 'users/categories'
    resources :tags, controller: 'users/tags', except: [:show, :edit, :update]
  end

  namespace :blog do
    resources :posts, only: [:index, :show]
  end
end
