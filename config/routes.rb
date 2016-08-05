Rails.application.routes.draw do
  root 'stories#index'

  resources :stories do
    resources :comments
  end

  devise_for :users, controllers: { registrations: 'registrations'}
end
