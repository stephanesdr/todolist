Rails.application.routes.draw do
  devise_for :users
  get 'tasks', to: "home#index"
  root to: "emails#index"
  resources :emails
  resources :tasks, except: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
