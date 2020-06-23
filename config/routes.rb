Rails.application.routes.draw do
  get 'home/top', to: 'homes#top'
  get 'home/about', to: 'homes#about'
  root 'homes#top'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get 'users/new', to: 'users#new'
  resources :users, only: [:show, :index, :edit, :update]

  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
