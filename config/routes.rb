Rails.application.routes.draw do
  get "dashboards", to: "dashboards#index"
  root "dashboards#index"
  resources :menus, only: [ :index, :new, :create, :edit, :update, :destroy ]
  resources :orders, only: [ :create, :show ]

  post "/veritrans/webhook", to: "orders#veritrans_webhook"
end
