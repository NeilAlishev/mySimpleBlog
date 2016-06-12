Rails.application.routes.draw do
  devise_for :users

  resources :comments, only: %i(create update destroy)
  resources :articles
  resources :blogs, only: :index
  resources :feedbacks, only: %i(new create)

  root to: "articles#index"

  get "/article_search", to: "article_search#index"
  get "/aboutUs", to: "pages#about_us", as: "about_us"
  get "/:full_name", to: "blogs#show", as: "blog"
end
