AptAlertNyc::Application.routes.draw do
  resources :users do
    resources :favorite_listings
  end

  root "welcome#index"
end
