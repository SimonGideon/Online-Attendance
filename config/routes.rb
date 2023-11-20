Rails.application.routes.draw do
  resources :attendances
  resources :lecturer_units do
    post "generate_token", on: :member
    post "generate_qr_code", on: :member
  end
  devise_for :lecturers
  devise_for :students
  root "home#index"
  resources :students_courses
  resources :courses
  resources :lecturers do
    post "generate_qr_code", on: :member
  end
  resources :students
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
