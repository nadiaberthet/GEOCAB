Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :searches, only: [:create, :update, :show]

  resources :todo_lists, only:[:index, :update]

  resources :users, only:[:update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
