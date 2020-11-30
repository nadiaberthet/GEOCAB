Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'mes_locaux', to: 'users#mes_locaux'
  get 'dashboard', to: 'searches#dashboard', as: :dashboard
  get '/users/:id/mes_locaux', to: 'users#mes_locaux', as: "mes_locaux"
  get '/users/:id/chiffres_cles', to: 'users#chiffres_cles', as: "chiffres_cles"

  resources :searches, only: [:new, :create, :update, :show] do
    get 'questionnaire-step-1', on: :collection, as: :step1
    get 'questionnaire-step-2', on: :collection, as: :step2
    post 'questionnaire-step-1', on: :collection, to: 'searches#questionnaire_step_1_submit'
    post 'questionnaire-step-2', on: :collection, to: 'searches#questionnaire_step_2_submit'
  end

  resources :todo_lists, only:[:index, :update]

  resources :users, only:[:edit, :update]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
