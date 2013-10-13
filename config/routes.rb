NinetyNineLuftballons::Application.routes.draw do
  root :to => "luftballons#index"

  resources :luftballons
  resources :luftballon_rental_requests, :only => [:new, :create] do
  	post "approve", :on => :member  	
  	post "deny", :on => :member
  end
end
