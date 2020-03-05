Rails.application.routes.draw do

  resources :topics
  resources :captions
  resources :comic_topics
  resources :comics
  resources :users
  root to: "application#home"

  # patch "/comics/:id", to: "comics#like", as: "like"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "welcome", to: "sessions#welcome"
  get "authorized", to: "sessions#page_requires_login"
  get "/logout", to: "sessions#destroy"
  
  patch "/captions/:id/like", to: "captions#like"

end
