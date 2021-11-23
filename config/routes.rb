Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :expenses #Matan testing purposes, delete later

  resource :profile, [:show]

  resources :accounts, only: [:new, :create] do
    resources :expenses, only: [:create]
  end

  resources :recommendations, only: [:index] do
    resources :pledges, only: [:create]
  end

  resources :pledges, only: [:index, :complete]

  resource :dashboard, only: [:show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  if Rails.env.development?
    get '/kitchensink', to: 'pages#kitchensink'
  end
end
