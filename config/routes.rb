Rails.application.routes.draw do
  namespace :user do
    get 'users/show'
    get 'users/edit'
    get 'users/unsubscribe'
  end
  namespace :user do
    get 'homes/top'
  end
  namespace :users do
    get 'users/show'
  end
  
  # 顧客用
  # URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }
  
  scope module: :user do
    root to: "homes#top"
    get 'about' => 'homes#about'
    resources :posts, only: [:index,:show]
    
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

end
