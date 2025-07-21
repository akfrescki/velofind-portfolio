Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :bikes, only: [:create, :edit, :update] do
    resources :matches, only: [:index] do
      resources :reports, only: [:new, :create, :index]
    end
  end

  resources :bookings, only: [:edit, :update]

  get '/dashboard', to: 'users#dashboard', as: :dashboard

  resources :promos, only: [:index]
end
