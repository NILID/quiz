Rails.application.routes.draw do
  root 'main#index'
  devise_for :users
  resources :users, only: %i[index edit update] do
  end
end
