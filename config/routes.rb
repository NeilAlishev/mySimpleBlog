Rails.application.routes.draw do
  devise_for :users

  resources :comments, only: %i(create update destroy)
  resources :articles
  resources :blogs, only: :index

  root to: "pages#home"

  get "/:full_name", to: "blogs#show", as: "blog"
end
