Rails.application.routes.draw do
  resources :transactions, only: [:index, :create]
  resources :accounts, only: [:show, :create]
end
