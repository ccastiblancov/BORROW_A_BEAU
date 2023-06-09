Rails.application.routes.draw do
  devise_for :users
  root to: "profiles#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :profiles do
    resources :bookings, only: %i[create new]
  end

  resources :bookings do
    resources :reviews, only: %i[create update]
    collection do
      get :my_bookings
    end
  end
end
