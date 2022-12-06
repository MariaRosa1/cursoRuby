Rails.application.routes.draw do

  namespace :users_backoffice do
    get 'welcome/index'
    get 'profile', to: 'profile#edit'
    patch 'profile', to: 'profile#update'
    get 'zip_code', to: 'zip_code#show'
  end
  namespace :site do
    get 'welcome/index'
    get 'search', to: 'search#questions'
    get 'subject/:subject_id/:subject', to: 'search#subject', as:'search_subject'
    post 'answer', to: 'answer#question'
    get 'alphabetical', to: 'search#alphabetical'
  end
  namespace :admins_backoffice do
    get 'welcome/index'  #dashboard
    resources :admins, except: [:show]   #adm
    resources :subjects #assuntos
    resources :questions
    resources :answers
  end

  devise_for :admins, skip: [:registrations]
  devise_for :users

  get 'users/index'
  get 'users/show'
  get 'inicio', to: 'site/welcome#index'
  get 'backoffice', to: 'admins_backoffice/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'site/welcome#index'
end
