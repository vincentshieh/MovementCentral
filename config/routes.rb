Rails.application.routes.draw do
  root to: 'static_pages#root'

  resources :users, only: [:create, :new, :index]
  resource :sessions, only: [:create, :new, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :posts, only: [:create, :index]
    resources :comments, only: [:create, :index]
    resources :friendships, only: [:create, :destroy, :index, :update]
    resources :likes, only: [:create, :destroy]

    get 'posts/feed', to: 'posts#feed'
    get 'likes/comment_index', to: 'likes#comment_index'
    get 'likes/post_index', to: 'likes#post_index'
    get 'users/search', to: 'users#search'
    get 'friendships/friends', to: 'friendships#friends'
    post 'users/update_attribute', to: 'users#update_attribute'
  end
end
