Rails.application.routes.draw do
  resources :clients, only: [:index, :show]
  resources :gyms, only: [:index, :show, :destroy]
  resources :memberships, only: [:index, :create]
end
