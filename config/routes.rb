Rails.application.routes.draw do
  namespace :users do
  get 'tags/index'
  end

  namespace :users do
  get 'tags/show'
  end

  namespace :users do
  get 'tags/edit'
  end

  namespace :users do
  get 'tags/update'
  end

  namespace :users do
  get 'tags/create'
  end

  namespace :users do
  get 'tags/destroy'
  end

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
    resources :tags, controller: 'users/tags'
  end

  namespace :blog do
    resources :posts, only: [:index, :show]
  end
end
