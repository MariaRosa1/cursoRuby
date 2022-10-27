Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'welcome/index'
  get 'inicio', to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
end
