Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  if Rails.env.development?
    Rails.application.routes.default_url_options[:host] = "localhost:3000"
  elsif Rails.env.production?
    Rails.application.routes.default_url_options[:host] = "revisionhub.uk"
  end

  devise_for :students, controllers: { registrations: 'registrations',
                                        passwords: 'passwords',
                                        confirmations: 'confirmations' }, path: '',
                        path_names: { sign_in: 'signin',
                                      sign_out: 'signout',
                                      sign_up: 'signup',
                                      password: 'forgot',
                                      confirmation: 'confirm' }

  get '/blog', to: 'pages#blog'
  get '/demo', to: 'pages#demo'
  get '/features', to: 'pages#features'
  get '/pricing', to: 'pages#pricing'

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
