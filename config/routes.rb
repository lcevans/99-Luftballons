NinetyNineLuftballons::Application.routes.draw do
  root :to => "luftballons#index"

  resources :luftballons
end
