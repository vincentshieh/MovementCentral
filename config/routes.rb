Rails.application.routes.draw do
  root to: 'static_pages#root'

  resources :users, only: [:create, :new, :index]
  resource :session, only: [:create, :new, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :posts, only: [:create, :index]
    get 'posts/feed', to: 'posts#feed'
    resources :comments, only: [:create, :index]
    resources :friendships, only: [:create, :destroy, :index, :update]
  end
end
