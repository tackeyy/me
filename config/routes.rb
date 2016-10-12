Rails.application.routes.draw do
  get 'dashboad/index'

  root 'home#index'
  get 'about', to: 'about#index'

  get 'dashboad', to: 'dashboad#index'
  resource :users, only: [:show, :edit, :update, :destroy] do
    resource :sign_up, controller: 'users/sign_up', only: [:show, :create]
    resource :sign_in, controller: 'users/sign_in', only: [:show, :create]
    resource :sign_out, controller: 'users/sign_out', only: [:destroy]
    resources :posts, controller: 'users/posts'
    resources :categories, controller: 'users/categories', only:
      [:index, :create, :new]
    resources :tags, controller: 'users/tags', only: [:index, :create, :new]
    get 'tag/list', to: 'users/tags#list'
  end

  namespace :blog do
    resources :posts, only: [:index, :show]
  end
end
