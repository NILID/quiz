Rails.application.routes.draw do
  resources :questions do
    member do
      put :check
    end
  end
  root 'main#index'
  devise_for :users
  resources :users, only: %i[index edit update] do
  end
  get :audit, to: 'main#audit'
end
