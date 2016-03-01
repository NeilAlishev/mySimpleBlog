Rails.application.routes.draw do
  resources :comments
  devise_for :users
  resources :articles
  resources :blogs, only: :index
  root to: "pages#home"
  get '/:username', to: 'blogs#show', as: 'blog'
end
