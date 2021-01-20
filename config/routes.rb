Rails.application.routes.draw do
  resources :rounds, except: %i[edit update]
  resources :questions do
    member do
      get :check
    end
  end
  root 'questions#index'
  devise_for :users
  resources :users, only: %i[index edit update] do
  end
  get :audit, to: 'main#audit'
end
