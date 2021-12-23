Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :shops
  resources :users, only: [:show, :edit, :update, :destroy] do
    collection do
      get :favorite
    end
  end
  resources :profiles, only: [:new, :create, :edit, :update]
  resources :tweets do
    resources :tweet_comments
    collection do
      get 'search'
    end
  end

  resources :rooms, only:[:create,:show]
  resources :messages, only:[:create]

  resources :items do
    member do
      get :favorite
    end
    collection do
      get 'search'
      get 'category'
    end
    resources :orders, only: [:index, :create]
    resources :comments, only: [:create]
  end
end