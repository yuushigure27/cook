Rails.application.routes.draw do


  # 顧客用
  # URL /users/sign_in ...
  devise_for :users, controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  scope module: :user do
    root to: "homes#top"
    get 'about' => 'homes#about'
    resources :posts, only: [:index,:new,:create,:show,:edit,:update, :destroy]

    get 'users' => 'users#index'
    get 'users/my_page' => 'users#show'
    get 'users/information/edit' => 'users#edit'
    patch 'users/information' => 'users#update'
    get 'users/unsubscribe' => 'users#unsubscribe'
    patch 'users/withdraw' => 'users#withdraw'

  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: "sessions#new"  # 管理者ログイン画面
    resources :genres, only: [:index,:edit,:destroy]
    resources :posts, only: [:index,:new,:create,:show,:edit,:update,:destroy]
    resources :users, only: [:index,:show,:edit,:update]
  end

end
