Rails.application.routes.draw do
  resources :payments

  resources :lists
  resources :publications
  resources :contacts
  resources :users
  resources :payments

  
  # root should always be last
  root to: 'pages#home'
end