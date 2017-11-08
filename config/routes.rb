Rails.application.routes.draw do

  devise_for :consumers
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'welcome/index'
  root 'welcome#index'

  namespace :api do
    resources :consumers, only: [:create, :show, :index, :update]
  end

  resources :articles do
    resources :comments
  end

end
