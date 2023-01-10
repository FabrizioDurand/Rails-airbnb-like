Rails.application.routes.draw do
  devise_for :users
  # root to: "rooms#index"
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :rooms do
    resources :bookings, only: %i[create]
  end

  resources :bookings, only: %i[destroy] do
    collection do
      get :dashboard
    end
  end
end
