Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :bikes, only: [:create] do
    resources :matches, only: [:index]
  end

  get '/dashboard', to: 'users#dashboard', as: :dashboard

  resources :promos, only: [:index]
end
