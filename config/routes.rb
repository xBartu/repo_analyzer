Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'dashboard#index'

  resources :analysis, only: :index
  resources :csv, only: :index
end
