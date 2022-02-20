Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  resources :shops do
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :edit, :update, :destroy] do
    collection do
      get :favorite
      get :tweetfavorite
      get :sale
      get :buy
    end
    member do
      get :follow
      get :followees
      get :follower
    end
  end
  resources :profiles, only: [:new, :create, :edit, :update]
  resources :tweets do
    resources :tweet_comments
    collection do
      get 'search'
    end
    member do
      get :favorite
    end
  end
  resources :notifications, only: [:index]
  resources :rooms, only:[:index,:create,:show]
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