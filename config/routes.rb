Rails.application.routes.draw do
  # get 'groups/index'
  # get 'groups/new'
  # get 'groups/show'
  # get 'groups/create'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :groups, only: [:index, :new, :create, :show, :destroy]

  root to: 'home#index'
end
