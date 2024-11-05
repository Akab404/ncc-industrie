Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  get "admin", to: "pages#admin"

  get "expertises/industrie", to: "pages#expertises"
  get "expertises/recherche", to: "pages#expertises"
  get "expertises/programmation", to: "pages#expertises"
  get "expertises/qualification", to: "pages#expertises"

  resources :job_offers

  resources :projects

  resources :contacts, only: [:new, :create]

  resources :articles do
    resource :cover_image, only: [:destroy], module: :articles
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
