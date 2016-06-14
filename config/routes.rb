Rails.application.routes.draw do
  devise_for :users

  root to: "articles#index"

  resources :comments, only: %i(create update destroy)
  resources :articles
  resources :feedbacks, only: %i(new create)

  get "/aboutUs", to: "pages#about_us", as: "about_us"
  get "/blogs/:full_name", to: "blogs#show", as: "blog"
end
