Rails.application.routes.draw do
  root to: "pages#home"

  resources :patients, only: %i[index show] do
    resources :consultations, only: %i[new create]
  end

  resources :consultations, only: %i[index show] do
    resources :diagnostics, only: %i[new create]
  end

  resources :diagnostics, only: %i[index show] do
    resources :assignations, only: :create
  end

  resources :assignations, only: %i[show edit update]
end
