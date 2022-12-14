Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
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
  resources :users, only: [:index, :show, :update] do
    match '/show', to: 'users#show', via: [:head]
    resources :contacts, only: [:index, :show, :create, :destroy, :update] do
      resources :logs, only: [:index, :show, :create, :destroy, :update]
    end 
  end
end
