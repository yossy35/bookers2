Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  devise_for :users
  resources :users, :books
  # resources :users, only: [:show, :edit]
  # resources :books,
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
