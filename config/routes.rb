Rails.application.routes.draw do
  devise_for :patients, path: 'patients'
  #:controllers => { :invitations => 'patients/invitations' }
  devise_for :doctors, path: 'doctors'


  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  mount ActionCable.server, at: '/cable'

  resources :doctors, only: ['index', 'show', 'update', 'edit'] do
    resources :documents, only: ['create', 'delete']
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
    resources :documents, only: ['create', 'delete']
    resources :appointments, only: ['new', 'create', 'index', 'show'] do
      resources :prescriptions, only: ['new', 'create'] do
        resources :doses, only: ['new', 'create']
      end
    end

    resources :chats, only: ['show', 'create', 'update'] do
      resources :messages, only: ['show', 'new', 'create']
    end


    member do
      get '/chatroom', to: 'patients#chatroom'
    end
  end

  get '/sign-in', to: 'pages#sign_in', as: 'sign-in'
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  post '/dashboard', to: 'pages#invite_patients', as: 'invite'


  get '/patient', to: 'pages#patient', as: :patient_landing
  get '/doctor', to: 'pages#doctor', as: :doctor_landing

  post '/appointments/:id/accept', to: 'appointments#accept', as: :accept_appointment
  post '/appointments/:id/reject', to: 'appointments#reject', as: :reject_appointment
end


# Landing Page
# Dashboard -> Users and Doctors -> Identify which one they are
  # Doctors -> Patients, Conversations
  # Patients -> Doctors, Conversations
