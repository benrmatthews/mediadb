Rails.application.routes.draw do
  resources :lists
  resources :publications
  resources :contacts
  resources :charges

  root :to => "visitors#index"
  devise_for :users
  resources :users
  
  
end
