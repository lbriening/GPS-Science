GpsScience::Application.routes.draw do
  resources :points

  resources :tests

  resources :test_runs

  resources :days
  root "days#index"
end
