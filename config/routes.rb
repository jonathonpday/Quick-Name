Rails.application.routes.draw do
  devise_for :users
  root 'site#index'  

  resources :admin, only: %i[index create update destroy]
  resources :users
end
