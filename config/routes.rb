Rails.application.routes.draw do
  resources :houses
  devise_for :users
  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end
  root "static_pages#index"
  get "/posts/detail", to: "static_pages#detail_post"
  get "/users/profile", to: "static_pages#profile"

  put "active_host" => "users#active_host"

  post "/comment" => "comments#create"

  resources :house_photos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
