Rails.application.routes.draw do
  resources :transactions
  resources :accounts, only: [:show, :create]
end
