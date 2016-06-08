Rails.application.routes.draw do
  devise_for :users

  resources :comments, only: %i(create update destroy)
  resources :articles
  resources :blogs, only: :index
  resources :feedbacks, only: %i(new create)

  root to: "pages#home"

  get "/aboutUs", to: "pages#about_us", as: "about_us"
  get "/:user_slug", to: "blogs#show", as: "blog"
end
