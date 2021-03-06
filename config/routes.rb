Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resources :users,only: [:show, :edit, :update, :index] do
   	member do
      get :follows, :followers
    end
  end
   resources :relationships, only: [:create, :destroy]
   resources :books do
   	 resource :favorites,only:[:create, :destroy]
   	 resources :book_comments, only: [:create, :destroy]
   end
 root :to => 'home#home'
 get "home/about" => "home#new"
 get "search" => "users#search"
  end
