Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'

  resources :articles do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:create]
  end

  resource :profile, only: [:show, :edit, :update]
end
