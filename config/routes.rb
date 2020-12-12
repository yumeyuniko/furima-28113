Rails.application.routes.draw do
  # get 'comments/new'
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

  get 'contacts/index'
  #コンタクト

  get 'item_top', to: "items#item_top"
  #商品一覧

  get 'edit_item_path', to: "items#edit"
  #商品出品


end
