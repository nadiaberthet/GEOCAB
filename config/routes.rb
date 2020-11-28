Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'insights/:id', to: 'pages#insights', as: "insights"
  get '/users/:id/mes_locaux', to: 'users#mes_locaux', as: "mes_locaux"
  get '/users/:id/chiffres_cles', to: 'users#chiffres_cles', as: "chiffres_cles"
  get '/users/:id/dashboard' => 'users#dashboard', as: "dashboard"

  resources :searches, only: [:new, :create, :update, :show]

  resources :todo_lists, only:[:index, :update]

  resources :users, only:[:edit, :update] do
    get '/dashboard' => 'users#dashboard'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
