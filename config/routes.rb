Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update, :index]
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit]
  root to: 'tops#home'
  get "home/about" => "tops#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
