# == Route Map
#
#              Prefix Verb   URI Pattern                          Controller#Action
#                root GET    /                                    home#index
#               about GET    /about(.:format)                     about#index
#       users_sign_up POST   /users/sign_up(.:format)             users/sign_up#create
#                     GET    /users/sign_up(.:format)             users/sign_up#show
#       users_sign_in POST   /users/sign_in(.:format)             users/sign_in#create
#                     GET    /users/sign_in(.:format)             users/sign_in#show
#      users_sign_out DELETE /users/sign_out(.:format)            users/sign_out#destroy
#         users_posts GET    /users/posts(.:format)               users/posts#index
#                     POST   /users/posts(.:format)               users/posts#create
#      new_users_post GET    /users/posts/new(.:format)           users/posts#new
#     edit_users_post GET    /users/posts/:id/edit(.:format)      users/posts#edit
#          users_post GET    /users/posts/:id(.:format)           users/posts#show
#                     PATCH  /users/posts/:id(.:format)           users/posts#update
#                     PUT    /users/posts/:id(.:format)           users/posts#update
#                     DELETE /users/posts/:id(.:format)           users/posts#destroy
#    users_categories GET    /users/categories(.:format)          users/categories#index
#                     POST   /users/categories(.:format)          users/categories#create
#  new_users_category GET    /users/categories/new(.:format)      users/categories#new
# edit_users_category GET    /users/categories/:id/edit(.:format) users/categories#edit
#      users_category GET    /users/categories/:id(.:format)      users/categories#show
#                     PATCH  /users/categories/:id(.:format)      users/categories#update
#                     PUT    /users/categories/:id(.:format)      users/categories#update
#                     DELETE /users/categories/:id(.:format)      users/categories#destroy
#          users_tags GET    /users/tags(.:format)                users/tags#index
#                     POST   /users/tags(.:format)                users/tags#create
#       new_users_tag GET    /users/tags/new(.:format)            users/tags#new
#      tag_list_users GET    /users/tag/list(.:format)            users/tags#list
#          edit_users GET    /users/edit(.:format)                users#edit
#               users GET    /users(.:format)                     users#show
#                     PATCH  /users(.:format)                     users#update
#                     PUT    /users(.:format)                     users#update
#                     DELETE /users(.:format)                     users#destroy
#          blog_posts GET    /blog/posts(.:format)                blog/posts#index
#           blog_post GET    /blog/posts/:id(.:format)            blog/posts#show
#       blog_category GET    /blog/categories/:id(.:format)       blog/categories#show
#            blog_tag GET    /blog/tags/:id(.:format)             blog/tags#show
#

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
