Rails.application.routes.draw do
  devise_for :users
  
  root 'site#index'

  resources :manual
  
  resources :admin, only: %i[index create update destroy]

  resources :users do
    resources :displays do
      resources :contents, shallow: true
    end
  end
end
