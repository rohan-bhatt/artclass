Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "prompts#index"
  resources :favorited_works
  resources :medium_types
  resources :artworks
  resources :moods
  resources :prompts
  devise_for :artists
  resources :artists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
