Rails.application.routes.draw do
  devise_for :patients, path: 'patients'
  devise_for :doctors, path: 'doctors'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  mount ActionCable.server => '/cable'

  resources :doctors, only: ['index', 'show', 'update', 'edit'] do
    resources :chatrooms, only: ['show', 'create'] do
      resources :messages
    end
  end

  resources :patients, only: ['index', 'show', 'update', 'edit'] do
    resources :chatrooms, only: ['show', 'create'] do
      resources :messages, only: ['show', 'new', 'create']
    end
  end

  get '/sign-in', to: 'pages#sign_in', as: 'sign-in'
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
end


# Landing Page
# Dashboard -> Users and Doctors -> Identify which one they are
  # Doctors -> Patients, Conversations
  # Patients -> Doctors, Conversations
