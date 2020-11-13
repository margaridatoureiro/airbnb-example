Rails.application.routes.draw do
  get 'searches/index'
  devise_for :users
  root to: 'pages#home'
  resources :users, only: :show do
    collection do
      get 'flat_owners'
      get 'flat_customers'
    end
  end

  get 'my_flats', to: 'pages#my_flats'
  get 'my_bookings', to: 'pages#my_bookings'

  resources :flats do
    resources :bookings, only: :create
  end
  resources :bookings, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
