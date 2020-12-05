Rails.application.routes.draw do
  get 'comments/new'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  root to: 'items#index'
  resources :items do
    resources :comments, only: [:create]
    
    collection do
      get 'search'
    end
    

    resources :orders, only: [:index, :new, :create]
  end
end
