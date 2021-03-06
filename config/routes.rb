Rails.application.routes.draw do
  devise_for :users, controllers: {
                       omniauth_callbacks: "users/omniauth_callbacks",
                       registrations: "users/registrations",
                     }

  root to: "items#index"
  resources :items do
    resources :comments, only: [:create, :destroy]

    collection do
      get "search"
    end

    resources :orders, only: [:index, :new, :create]
  end

  resource :mypage, only: :show

  get "contacts/index"
  post "contacts/confirm" => "contacts#confirm"   # 確認画面
  post "contacts/thanks" => "contacts#thanks"    # 送信完了画面
  #コンタクト

  get "item_top", to: "items#item_top"
  #商品一覧

  get "edit_item_path", to: "items#edit"
  #商品出品
end
