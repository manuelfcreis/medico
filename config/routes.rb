Rails.application.routes.draw do
  devise_for :patients, path: 'patients'
  devise_for :doctors, path: 'doctors'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  mount ActionCable.server, at: '/cable'

  resources :doctors, only: ['index', 'show', 'update', 'edit'] do
    resources :appointments, only: ['show']
    resources :doctors_notes, only: ['show']
    resources :chats, only: ['show', 'create'] do
      resources :messages
    end

    member do
      get '/chatroom', to: 'patients#chatroom'
    end
  end

  resources :patients, only: ['index', 'show', 'update', 'edit'] do
    
    resources :appointments, only: ['new', 'create', 'show'] do
      resources :prescriptions, only: ['new', 'create'] do
        resources :doses, only: ['new', 'create']
      end
    end

    resources :chats, only: ['show', 'create'] do
      resources :messages, only: ['show', 'new', 'create']
    end


    member do
      get '/chatroom', to: 'patients#chatroom'
    end
  end

  get '/sign-in', to: 'pages#sign_in', as: 'sign-in'
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  get '/patient', to: 'pages#patient'
  get '/doctor', to: 'pages#doctor'
end


# Landing Page
# Dashboard -> Users and Doctors -> Identify which one they are
  # Doctors -> Patients, Conversations
  # Patients -> Doctors, Conversations
