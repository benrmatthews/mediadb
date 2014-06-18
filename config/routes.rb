Rails.application.routes.draw do
  resources :lists
  resources :publications
  resources :contacts

  root :to => "visitors#index"
  devise_for :users
  resources :users
  
  
end
