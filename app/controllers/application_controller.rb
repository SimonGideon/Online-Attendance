class ApplicationController < ActionController::Base
  # load_and_authorize_resource
  include CanCan::ControllerAdditions
  before_action :authenticate_student!, :authenticate_lecturer!, :authenticate_admin!, except: :root
  protect_from_forgery with: :exception
  require "jwt"

  def after_sign_in_path_for(resource)
    if resource.is_a?(Student)
      student_path(resource)
    elsif resource.is_a?(Lecturer)
      lecturer_path(resource)
    elsif resource.is_a?(Admin)
      admin_path(resource)
    else
      root_path
    end
  end

  private

  def current_ability
    @current_ability ||= ::Ability.new(current_student || current_lecturer || current_admin)
  end

  rescue_from CanCan::AccessDenied do |exception|
    exception.default_message = "You are not authorized to perform this task"
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to root_path, alert: exception.message }
    end
  end

  def root
    # Handle the root path without requiring authentication.
    # For example, you might want to render a public landing page.
    # Adjust this based on your application's requirements.
  end
end
