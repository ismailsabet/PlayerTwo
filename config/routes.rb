Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources "conversations" do
    resources "messages"
  end

  root "home#home"
  get "/browse" => "browse#browse", as: :browse
  get "/matches" => "browse#matches", as: :matches

  post "/approve/:id" => "browse#approve", as: :approve_user
  post "/decline/:id" => "browse#decline", as: :decline_user

  get 'users/:id' => 'users#show'
  post "/get/conversation/:id" => "browse#open_conversation", as: :open_conversation
end
