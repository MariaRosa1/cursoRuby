Rails.application.routes.draw do

  namespace :users_backoffice do
    get 'welcome/index'
  end
  namespace :site do
    get 'welcome/index'
    get 'search', to: 'search#questions'
    get 'subject/:subject_id/:subject', to: 'search#subject', as:'search_subject'
    post 'answer', to: 'answer#question'
  end
  namespace :admins_backoffice do
    get 'welcome/index'  #dashboard
    resources :admins, except: [:show]   #adm
    resources :subjects #assuntos
    resources :questions
    resources :answers
  end

  devise_for :admins
  devise_for :users

  get 'users/index'
  get 'users/show'
  get 'inicio', to: 'site/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'site/welcome#index'
end
