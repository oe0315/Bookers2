Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit]
  resources :books, only: [:new, :create, :index, :show]
  root to: 'users#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
