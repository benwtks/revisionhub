Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :students, controllers: { registrations: 'registrations' }

  get '/log', to: 'sessions#index'
  resources :sessions

  devise_scope :student do
    match '/sessions/student', to: 'devise/sessions#create', via: :post
  end

  authenticated :student do
    root 'subjects#index', as: "authenticated_root"
  end

  root 'pages#home'

  resources :subjects do
    resources :topics
  end
end
