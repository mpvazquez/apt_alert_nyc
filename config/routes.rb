AptAlertNyc::Application.routes.draw do
  devise_for :users
  resources :users do
    resources :favorite_listings
  end

  root "welcome#index"
end
