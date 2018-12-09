Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users
  resources :posts

  # get '/posts(.:format)', to: 'posts#index', as: :posts
  # get '/posts/:id(.:format)', to: 'posts#show', as: :post
  # get '/posts/:id/edit(.:format)', to: 'posts#edit', as: :edit_post
  # get '/posts/new(.:format)', as: :new_post

#     posts GET    /posts(.:format)          posts#index
#           POST   /posts(.:format)          posts#create
#  new_post GET    /posts/new(.:format)      posts#new
# edit_post GET    /posts/:id/edit(.:format) posts#edit
#      post GET    /posts/:id(.:format)      posts#show
#           PATCH  /posts/:id(.:format)      posts#update
#           PUT    /posts/:id(.:format)      posts#update
#           DELETE /posts/:id(.:format)      posts#destroy

  get 'about/me'
  root 'home#index'
  get '/home(/:hello)', to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
