Rails.application.routes.draw do
  devise_for :users
  resources :courses
  resources :professors
  root 'courses#index'
end
