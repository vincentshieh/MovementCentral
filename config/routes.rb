Rails.application.routes.draw do
  root to: 'static_pages#root'

  resources :users, only: [:create, :new, :index]
  resource :session, only: [:create, :new, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :posts, only: [:create, :index]
    resources :comments, only: [:create, :index]
    resources :friendships, only: [:create, :destroy, :index, :update]

    get 'posts/feed', to: 'posts#feed'
    post 'posts/:id/like', to: 'posts#like', as: 'post_like'
    post 'posts/:id/unlike', to: 'posts#unlike', as: 'post_unlike'
    post 'comments/:id/like', to: 'comments#like', as: 'comment_like'
    post 'comments/:id/unlike', to: 'comments#unlike', as: 'comment_unlike'
  end
end
