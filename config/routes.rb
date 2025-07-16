Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :bikes, only: [:create]
  get 'users/dashboard', to: 'users#dashboard'

  get '/dashboard', to: 'users#dashboard', as: :dashboard

  resources :promos, only: [:index, :new, :create]
end
