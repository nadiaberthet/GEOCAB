Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'insights/:id', to: 'pages#insights', as: "insights"
  get 'mes_locaux', to: 'users#mes_locaux'

  resources :searches, only: [:new, :create, :update, :show]

  resources :todo_lists, only:[:index, :update]

  resources :users, only:[:edit, :update]
  get '/dashboard' => 'users#dashboard', as: :dashboard

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
