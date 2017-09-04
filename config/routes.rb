Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :students, controllers: { registrations: 'registrations' }, skip: [:sessions, :registrations]

  get '/log', to: 'sessions#index'
  resources :sessions
  resources :subject_tags
  resources :topic_tags

  devise_scope :student do
    match '/sessions/student', to: 'devise/sessions#create', via: :post
    get 'signin', to: 'devise/sessions#new', as: :new_student_session
    post 'signin', to: 'devise/sessions#create', as: :student_session
    get 'signup', to: 'devise/registrations#new', as: :new_student_registration
    post '/signup', to: 'devise/registrations#create', as: :student_registration
    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_student_session
  end

  authenticated :student do
    root 'subjects#index', as: "authenticated_root"
  end

  root 'pages#home'

  resources :subjects do
    resources :topics
    resources :grades
  end
end
