AptAlertNyc::Application.routes.draw do
  resources :users do
    resources :favorite_listings
  end

  resources :areas

  get "/login", to: "session#new"
  post "/session", to: "session#create"
  delete "/session", to: "session#delete"

  root "welcome#index"
end
