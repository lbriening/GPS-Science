GpsScience::Application.routes.draw do
  resources :days
  root "days#index"
end
