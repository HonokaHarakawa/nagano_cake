Rails.application.routes.draw do
  
  namespace :admin do
    root to: "homes#top"
    resources :genres
    resources :items
    resources :customers
  end
  
  devise_for :admin, controllers: {
        sessions: 'admin/sessions'
  }
  
  devise_for :customers, controllers: {
        sessions: 'customers/sessions'
  }
  get 'customers/page' => 'customers#show'
  root to: "homes#top"
  get 'about' => 'homes#about'
  
end
