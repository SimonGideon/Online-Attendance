Rails.application.routes.draw do
  resources :lecturer_units
  devise_for :lecturers
  devise_for :students
  root "home#index"
  resources :students_courses
  resources :courses
  resources :lecturers
  resources :students
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
