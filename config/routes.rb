Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :bikes, only: [:create, :edit, :update] do
    resources :matches, only: [:index] do
      resources :reports, only: [:new, :create, :index, :show]
    end
  end

  resources :bookings, only: [:edit, :update]

  get '/dashboard', to: 'users#dashboard', as: :dashboard
  get '/orders/checkout', to: 'orders#checkout', as: :checkout_order


  resources :promos, only: [:index]
  resources :orders, only: [:show, :create]
end
