class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.is_a?(Student)
      # If it's a student, you can specify the path for students here.
      # For example, assuming you have a students index page.
      students_path
    elsif resource.is_a?(Lecturer)
      # If it's a lecturer, redirect to the lectures index page.
      lecturers_path
    else
      # Handle other user types or roles as needed.
      root_path
    end
  end
end
