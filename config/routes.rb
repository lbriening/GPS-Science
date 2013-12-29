GpsScience::Application.routes.draw do
  resources :tests

  resources :test_runs

  resources :days
  root "days#index"
end
