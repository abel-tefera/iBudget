Rails.application.routes.draw do
  # get 'expenses/index'
  # get 'expenses/new'
  # get 'expenses/create'
  # get 'groups/index'
  # get 'groups/new'
  # get 'groups/show'
  # get 'groups/create'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :groups, only: [:index, :new, :create, :show, :destroy] do
    resources :expenses, only: [:new, :create]
  end

  root to: 'home#index'
end
