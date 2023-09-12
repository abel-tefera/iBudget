Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :groups, only: [:index, :new, :create, :show, :destroy] do
    resources :expenses, only: [:new, :create]
  end

  get 'splash_screen', to: 'home#index'

  root to: 'groups#index'
end
