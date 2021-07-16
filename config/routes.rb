Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users, only: [:show, :edit, :update]
  resources :profiles, only: [:new, :create, :edit, :update]
  resources :tweets do
    resources :tweet_comments
    collection do
      get 'search'
    end
  end

  resources :rooms do
    resources :messages
  end

  resources :items do
    collection do
      get 'search'
      get 'category'
    end
    resources :orders, only: [:index, :create]
    resources :comments, only: [:create]
  end
end