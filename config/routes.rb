Rails.application.routes.draw do
  resources :comments
  devise_for :users
  resources :articles
  resources :blogs, only: :index

  root to: "pages#home"

  get "/:full_name", to: "blogs#show", as: "blog"
end
