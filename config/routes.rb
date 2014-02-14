AptAlertNyc::Application.routes.draw do
  resources :users do
    resources :favorite_listings
  end

  resources :areas

  root "welcome#index"
end
