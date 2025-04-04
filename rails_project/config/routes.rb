Rails.application.routes.draw do
  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
  end

  namespace :client do
    get 'dashboard', to: 'dashboard#index'
    resources :orders, only: [:index, :new, :create]
  end

  resources :payments, only: [:new, :create]
end