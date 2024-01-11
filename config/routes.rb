Rails.application.routes.draw do
  resources :users
  resources :articles
  get 'search/index'
  root 'search#index'
end
