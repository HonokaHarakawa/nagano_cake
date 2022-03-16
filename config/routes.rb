Rails.application.routes.draw do
  
  namespace :admin do
    root to: "homes#top"
    resources :genres
    resources :items
    resources :customers
    get "orders/show" => "orders#show"
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
  patch 'customers/page' => 'customers#update'
  get 'customers/page/confirm' => 'customers#confirm'
  patch 'customers/withdraw' => 'customers#withdraw'
  root to: "homes#top"
  get 'about' => 'homes#about'
  resources :items, only: [:index, :show]
  resources :cart_items do
    collection do
      delete 'destroy_all'
    end
  end  
  get 'orders' => 'orders#index'
  get 'orders/new' => 'orders#new'
  get 'orders/thanks' => 'orders#thanks'
  post 'orders/confirm' => 'orders#confirm'
  post 'orders/new/:id' => 'orders#creste'
  resources :addresses
  
end
