Rails.application.routes.draw do
  resources :submission_tests
  resources :submissions
  resources :tests
  resources :exercices
  root to: "submissions#index"
end
