Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resources :users, only: [:show, :edit, :update, :index]
   resources :books
 root :to => 'home#home'
 get "home/about" => "home#new"

  end
