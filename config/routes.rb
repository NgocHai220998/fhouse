Rails.application.routes.draw do
  devise_for :users
  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end
  root "static_pages#index"
  get "/posts/detail", to: "static_pages#detail_post"
  get "/users/profile", to: "static_pages#profile"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
