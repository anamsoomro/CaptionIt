Rails.application.routes.draw do
  resources :topics
  resources :captions
  resources :comic_topics
  resources :comics
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
