Rails.application.routes.draw do
  resources :houses
  devise_for :users
  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end
  root "static_pages#index"
  get "/users/profile", to: "static_pages#profile"

  put "active_host" => "users#active_host"

  post "/comment" => "comments#create"
  post "/care" => "cares#create"
  delete "/care/:id" => "cares#destroy"

  # city houses
  get "/houses/city/:id" => "houses#houses_city"

  resources :house_photos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #import data
  resources :houses do
    collection { post :import }
  end
  resources :house_photos do
    collection { post :import }
  end
  resources :comments do
    collection { post :import }
  end
  resources :cares do
    collection { post :import }
  end
end
