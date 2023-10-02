Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :oyster_cards, only: [:create, :show, :update] do
    member do
      post 'enter_station', to: 'oyster_cards#enter_station'
      post 'leave_station', to: 'oyster_cards#leave_station'
      post 'ride_bus', to: 'oyster_cards#ride_bus'
    end
  end
end
