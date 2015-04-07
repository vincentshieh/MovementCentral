Rails.application.routes.draw do
  root to: redirect("/session/new")
  resources :users, only: [:create, :new, :index]
  resource :session, only: [:create, :new, :destroy]
end
