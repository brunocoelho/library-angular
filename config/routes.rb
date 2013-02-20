Library::Application.routes.draw do
  devise_for :users

  root to: 'books#index'

  resources :books

  match 'user', to: 'users#user'
end
