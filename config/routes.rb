NinetyNineLuftballons::Application.routes.draw do
  root :to => "luftballons#index"

  resources :luftballons
  resources :luftballon_rental_requests
end
