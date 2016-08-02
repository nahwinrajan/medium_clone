Rails.application.routes.draw do
  root 'stories#index'
  resources :stories
  devise_for :users, controllers: { registrations: 'registrations'}
end
