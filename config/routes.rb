Rails.application.routes.draw do
  devise_for :users
  resources :courses
  resources :reviews, path_names: {
    new: 'course/:course_id/professor/:professor_id/new',
  }
  get '/reviews/explore/course/:course_id/professor/:professor_id', to: 'reviews#explore'
  resources :professors
  root 'courses#index'
end
