Rails.application.routes.draw do
  resources :courses
  resources :professors
  root 'courses#index'
end
