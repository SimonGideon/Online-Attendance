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

    result = Attendance.create_attendance(selected_id)

    if result[:success]
      session.delete(:students_attendance_courses)
      redirect_to students_path, notice: result[:success]
    else
      redirect_to multiple_student_attendances_path, alert: result[:error]
    end
  end

  def mark_attendance
    token = params[:encoded_token]

    # Ensure the token is provided
    if token.blank?
      redirect_to students_path, alert: "Invalid Lecturer token provided. Please try again."
      return
    end

    begin
      # Decode jwt token
      decoded_payload = Attendance.decode_and_verify_token(token)
      lecturer_id = decoded_payload["lecturer_id"]

      result = Attendance.mark_attendance(lecturer_id, current_student)

      if result[:multiple_courses]
        @students_attendance_courses = result[:multiple_courses]
        session[:students_attendance_courses] = @students_attendance_courses
        redirect_to multiple_student_attendances_path
      elsif result[:success]
        redirect_to students_path, notice: result[:success]
      else
        redirect_to students_path, alert: result[:error]
      end
    rescue JWT::DecodeError => e
      redirect_to students_path, alert: "The lecturer token provided is invalid. Please try again."
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
