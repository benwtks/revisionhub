Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :students, controllers: { registrations: 'registrations' }, path: '',
                        path_names: { sign_in: 'signin', sign_out: 'signout', sign_up: 'signup', password: 'forgot',
                                      confirmation: 'confirm'}

  get '/log', to: 'sessions#index'
  resources :sessions
  resources :subject_tags
  resources :topic_tags

  devise_scope :student do
    match '/sessions/student', to: 'devise/sessions#create', via: :post
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
