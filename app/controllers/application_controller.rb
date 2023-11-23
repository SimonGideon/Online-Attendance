class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  require "jwt"

  def after_sign_in_path_for(resource)
    if resource.is_a?(Student)
      # If it's a student, redirect to their own profile (show) page.
      student_path(resource)
    elsif resource.is_a?(Lecturer)
      # If it's a lecturer, redirect to their own profile (show) page.
      lecturer_path(resource)
    else
      # Handle other user types or roles as needed.
      root_path
    end
  end
end
