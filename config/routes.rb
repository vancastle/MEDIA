Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :consultations, only: [:index, :new, :create] do
    resources :diagnostics, only: [:index, :new, :create]
  end

  resources :diagnostics, only: [:new, :show] do
    member do
      patch :select
    end

    resources :assignations, only: [:new, :create]
  end

  resources :assignations, only: [:index, :show] do
    resources :messages, only: [:index, :create]
  end

  resources :patients, only: %i[index show]
end
