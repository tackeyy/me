Rails.application.routes.draw do
  root 'home#index'

  namespace :blog do
    resources :posts, only: [:index, :show]
  end

  get 'about', to: 'about#index'
end
