AptAlertNyc::Application.routes.draw do
  resources :users do
    resources :favorites
  end

  resources :areas do
    resources :listings, except: :index
  end

  get "/listings", to: "listings#index"
  post "/listings", to: "listings#index"


  get "/login", to: "session#new"
  post "/session", to: "session#create"
  delete "/session", to: "session#delete"

  post "/favorites", to: "favorites#create"

  root "welcome#index"
end
