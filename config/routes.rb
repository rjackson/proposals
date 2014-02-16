Proposals::Application.routes.draw do
  devise_config = ActiveAdmin::Devise.config
  devise_config[:controllers][:sessions] = 'sessions'
  devise_for :users, devise_config
  ActiveAdmin.routes(self)

  resources :proposals
  resources :users
  get 'voting' => 'voting#index'
  resources :votes do
    post 'bulk_create' => 'votes#bulk_create', on: :collection
  end

  match '/auth/:provider/callback' => 'sessions#create', via: %i(get post)
  match '/auth/failure' => 'sessions#failure', via: %i(get post)
  match '/logout' => 'sessions#destroy', via: %i(get delete), as: :logout

  root to: "pages#welcome"
end
