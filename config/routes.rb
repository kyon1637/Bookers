Rails.application.routes.draw do
  devise_for :users
  root 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resources :users, only: [:show, :edit, :update]
   resources :books
end
