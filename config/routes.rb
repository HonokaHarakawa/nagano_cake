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
  resources :customers, only: :update
  get 'customers/page' => 'customers#show'
  get 'customers/page/edit' => 'customers#edit'
  root to: "homes#top"
  get 'about' => 'homes#about'
  
end
