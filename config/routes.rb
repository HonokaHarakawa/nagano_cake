Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  resources :customers
  namespace :admin do
    resources :genres
    resources :items
    resources :customers
  end
  
end
