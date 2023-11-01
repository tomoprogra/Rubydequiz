Rails.application.routes.draw do
  get 'questions/result', to: 'questions#result'
  resources :questions, only: [:show, :update, :result] do
    member do
      get 'explanation'
    end
    collection do
      get 'by_level/:level', to: 'questions#by_level', as: :by_level
      get 'result'
    end
  end
  get 'questions/by_level/:level', to: 'questions#by_level', as: 'questions_by_level'
  root to: "questions#top"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check 
end
