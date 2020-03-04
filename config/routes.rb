Rails.application.routes.draw do
  resources :topics
  resources :captions
  resources :comic_topics
  resources :comics
  resources :users
  root to: "application#home"

  # patch "/comics/:id", to: "comics#like", as: "like"
  get "/captions/:id/like", to: "captions#like"
end
