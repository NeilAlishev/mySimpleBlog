Rails.application.routes.draw do
  resources :articles
  resources :comments
  devise_for :users

  root to: "pages#home"
end
