Rails.application.routes.draw do
  devise_for :users

  resources :comments
  resources :articles
  resources :blogs, only: :index

  root to: "pages#home"

  get "/:full_name", to: "blogs#show", as: "blog"
end
