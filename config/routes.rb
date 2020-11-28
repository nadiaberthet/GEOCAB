Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'mes_locaux', to: 'users#mes_locaux'

  resources :searches, only: [:new, :create, :update] do
    get 'show', on: :collection
    get 'questionnaire', on: :collection
    get 'questionnaire2', on: :collection
    get 'dashboard', on: :collection
  end



  resources :todo_lists, only:[:index, :update]

  resources :users, only:[:edit, :update]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
