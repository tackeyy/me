Rails.application.routes.draw do
  get 'dashboad/index'

  root 'home#index'
  get 'about', to: 'about#index'

  get 'dashboad', to: 'dashboad#index'
  resource :users do
    resource :sign_up, controller: 'users/sign_up', only: [:show, :create]
    resource :sign_in, controller: 'users/sign_in', only: [:show, :create]
    resource :sign_out, controller: 'users/sign_out', only: [:destroy]
  end

  namespace :blog do
    resources :posts, only: [:index, :show]
  end
end
