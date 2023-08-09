# frozen_string_literal: true

Rails.application.routes.draw do
  root 'landing_pages#home'

  devise_for :users, controllers: { registrations: 'registrations' }, path: '', path_names: {
    sign_in: 'sign_in',
    sign_out: 'sign_out',
    sign_up: 'sign_up',
    password: 'password',
    confirmation: 'verification'
  }

  resources :users, only: %i[index show] do
    resources :recipes, only: %i[index show new create destroy]
  end
  resources :foods

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
