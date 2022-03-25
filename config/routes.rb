Rails.application.routes.draw do
  
  namespace :admin do
    root to: "homes#top"
    resources :genres
    resources :items
    resources :customers
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end
  
  devise_for :admin, controllers: {
        sessions: 'admin/sessions'
  }
  
  devise_for :customers, controllers: {
        sessions: 'customers/sessions',
        registrations: 'customers/registrations'
  }
  get 'customers/page' => 'customers#show'
  get 'customers/page/edit' => 'customers#edit'
  patch 'customers/page/:id' => 'customers#update'
  get 'customers/page/confirm' => 'customers#confirm'
  patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'
  root to: "homes#top"
  get 'about' => 'homes#about'
  resources :items, only: [:index, :show]
  resources :cart_items do
    collection do
      delete 'destroy_all'

    end
  end   
  get 'orders/thanks' => 'orders#thanks'
  resources :orders, only: [:index, :new, :show]
  post 'orders' => 'orders#create'
  post 'orders/confirm' => 'orders#confirm'
  resources :addresses

end
