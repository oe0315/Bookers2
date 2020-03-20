Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :users, :only => [:show]
  root to: 'users#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
