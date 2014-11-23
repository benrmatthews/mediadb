Rails.application.routes.draw do
  resources :lists
  resources :publications
  resources :contacts
  
  devise_for :users, controllers: { registrations: 'users/registrations' }
  
  devise_scope :user do
    get '/sign_up', to: 'users/registrations#new', as: :sign_up
    get '/sign_in', to: 'devise/sessions#new', as: :sign_in
    get '/:id/edit', to: 'users/registrations#edit', as: :edit
    put 'users/update_plan', :to => 'users/registrations#update_plan'
    put 'users/cancel_plan', :to => 'users/registrations#cancel_plan'
  end

  resources :users, only: [:index, :show]
  
  # root should always be last
  root to: 'pages#home'
end