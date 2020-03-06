Rails.application.routes.draw do

  resources :topics
  resources :captions
  resources :comic_topics
  resources :comics
  resources :users
  root to: "application#home" 

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "/welcome", to: "sessions#new"
  get "authorized", to: "sessions#page_requires_login"
  get "/logout", to: "sessions#destroy"
  # get "/new", to: "sessions#new"
  
  patch "/captions/:id/like", to: "captions#like"

end
