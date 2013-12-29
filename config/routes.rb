GpsScience::Application.routes.draw do
  resources :test_runs

  resources :days
  root "days#index"
end
