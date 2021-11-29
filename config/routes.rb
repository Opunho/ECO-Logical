Rails.application.routes.draw do
  get 'charts/chartview'
  get 'chart/chartview'
  get 'home/chartview'
  devise_for :users
  root to: 'pages#home'
  resources :expenses #Matan testing purposes, delete later

  resource :profile, only: [:show]

  resources :accounts, only: [:new, :create] do
    resources :expenses, only: [:create]
  end

  resources :recommendations, only: [:index, :show] do
    resources :pledges, only: [:create]
  end

  resources :pledges, only: [:index] do
    member do
      patch :complete
    end
  end


  resource :dashboard, only: [:show]

  get "/calculate", to: "expenses#set_transactions", as: "fetch_expenses"

  resource :chart, only: [:chartview]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  if Rails.env.development?
    get '/kitchensink', to: 'pages#kitchensink'
  end
end
