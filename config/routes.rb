Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :bikes, only: [:create] do
    resources :matches, only: [:index] do
      resources :reports, only: [:new, :create, :index]
    end
  end

  get '/dashboard', to: 'users#dashboard', as: :dashboard
  get '/orders/checkout', to: 'orders#checkout', as: :checkout_order


  resources :promos, only: [:index]
  resources :orders, only: [:show, :create]
end
