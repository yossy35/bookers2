Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  <%= stylesheet_pack_tag
  resources :users, only: [:show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
