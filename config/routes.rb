Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root to: "users#index"

  resources :contacts, only: [:index, :show, :create, :destroy, :update]
  resources :users, only: [:index, :show, :update]
end
