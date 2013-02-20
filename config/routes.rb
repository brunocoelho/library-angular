Library::Application.routes.draw do
  devise_for :users

  root to: 'books#index'

  resources :books
end
