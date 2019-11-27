Rails.application.routes.draw do
  root 'application#index'

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  resources :books

end
