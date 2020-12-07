Rails.application.routes.draw do
  devise_for :users
  root to: 'vitamins#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :vitamins, only: %i[index show] do
    resources :activities, only: %i[new create]
    resources :food_intakes, only: %i[new create]
    resources :daily_vitamins, only: %i[index show], module: :vitamins
  end
end
