Rails.application.routes.draw do
  get 'users/show'
  root 'homes#top'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }  
  resources :users, only: [:show, :index]

  resources :books, only: [:new, :create, :index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
