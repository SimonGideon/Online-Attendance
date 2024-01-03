Rails.application.routes.draw do
  devise_for :admins
  resources :admins do
    resources :courses
    resources :lecturer_units
    resources :students_courses
    resources :lecturers
    resources :students
  end
  devise_for :lecturers
  devise_for :students
  root "home#index"
  resources :lecturers do
    post "generate_token", on: :member
    post "generate_qr_code", on: :member
    resources :lecturer_units
  end
  resources :students do
    resources :attendances do
      collection do
        get "scan"
        post "mark_attendance"
        post "assign_lecturer_unit"
      end
    end
    resources :students_courses
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
