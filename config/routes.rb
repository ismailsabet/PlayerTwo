Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources "conversations" do
    resources "messages"
  end

  root "home#home"
  get "/browse" => "browse#browse", as: :browse
  get "/matches" => "matches#matches", as: :matches

  post "/approve/:id" => "browse#approve", as: :approve_user
  post "/decline/:id" => "browse#decline", as: :decline_user

  get "/messages" => "messages#browse", as: :browse_messages

  get 'users/:id' => 'users#show', as: :show_user
  post "get/conversation/:id" => "matches#open_conversation", as: :open_conversation

  get '/steam/connect' => 'users#steam_index'
  post "/get/steamid" => "users#get_steamid"

end
