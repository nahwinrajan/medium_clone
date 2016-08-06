Rails.application.routes.draw do
  root 'stories#index'

  resources :stories do
    resources :comments
    member do
      put "like",     to: "stories#upvote"
      put "unlike",  to: "stories#downvote"
    end
  end

  devise_for :users, controllers: { registrations: 'registrations'}
end
