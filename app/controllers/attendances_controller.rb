class AttendancesController < ApplicationController
  before_action :set_attendance, only: %i[ show edit update destroy ]

  # GET /attendances or /attendances.json
  def index
    @attendances = Attendance.all
  end

  # GET /attendances/1 or /attendances/1.json
  def show
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
  end

  # GET /attendances/1/edit
  def edit
  end

  def scan
  end

  def multiple
    @students_attendance_courses = session[:students_attendance_courses]
    puts @students_attendance_courses
  end

  def submit_attendance
    selected_id = params[:selected_id]
    if selected_id.blank?
      redirect_to multiple_student_attendances_path, alert: "Please select a valid ID"
      return
    end

    create_attendance(selected_id)
    session.delete(:students_attendance_courses)
  end

  # mark attendance decode
  def mark_attendance
    token = params[:encoded_token]

    # Ensure the token is provided
    if token.blank?
      render json: { error: "Token is missing" }, status: :unprocessable_entity
      return
    end

    begin
      #decode jwt token
      decoded_payload = Attendance.decode_and_verify_token(token)
      lecturer_id = decoded_payload["lecturer_id"]
      lecturer = Lecturer.find_by(id: lecturer_id)
      if lecturer
        my_student_course = lecturer.lecturer_units.flat_map(&:students_courses).uniq.select { |course| course.student_id == current_student.id }
        if my_student_course.size > 1
          @students_attendance_courses = my_student_course
          puts @students_attendance_courses
          puts "Render multiple"
          session[:students_attendance_courses] = @students_attendance_courses
          redirect_to multiple_student_attendances_path
          return
        else
          # If there is only one result or none, proceed with the first result
          @student_course = my_student_course
          my_student_course_id = @student_course.first&.id
        end
        result = Attendance.create_attendance(my_student_course_id)
        if result[:success]
          redirect_to root_path, notice: result[:success]
        else
          render json: { error: result[:error] }, status: :unprocessable_entity
        end
      else
        render json: { error: "Lecturer not found for the given lecturer_id" }, status: :unprocessable_entity
      end
    rescue JWT::DecodeError => e
      render json: { error: "Invalid token format" }, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_attendance
    @attendance = Attendance.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def attendance_params
    params.require(:attendance).permit(:students_course_id, :attendance_date, :present)
  end
end
