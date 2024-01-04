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
      payload = JWT.decode(token, Rails.application.credentials.secret_key_base, true, algorithm: "HS256")[0]
      lecturer_id = payload["lecturer_id"]
      lecturer = Lecturer.find_by(id: lecturer_id)
      if lecturer
        my_student_course = lecturer.lecturer_units.flat_map(&:students_courses).uniq.find_by(student_id: current_student.id)
        if my_student_course.size > 1
          # Render a pop-up page with a list of results and radio buttons for selection
          render "attendance/multiple_results", locals: { my_student_course: my_student_course }
        else
          # If there is only one result or none, proceed with the first result
          my_student_course_id = my_student_course.first&.id
        end
      else
        render json: { error: "Lecturer not found for the given lecturer_id" }, status: :not_found
      end

      if lecturer_unit
        Attendance.find_or_create_by(
          students_course_id: my_student_course_id,
          attendance_date: Date.today,
        ) do |attendance|
          attendance.present = true
        end
        render json: { message: "Attendance marked successfully" }
      else
        render json: { error: "Invalid lecturer_unit_id" }, status: :unprocessable_entity
      end
    rescue JWT::DecodeError
      render json: { error: "Invalid token format" }, status: :unprocessable_entity
    end
  end

  # POST /attendances or /attendances.json
  def create
    @attendance = Attendance.new(
      students_course_id: attendance_params[:student_id],
      attendance_date: Date.today,
      present: true,
    )

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to attendance_url(@attendance), notice: "Attendance was successfully created." }
        format.json { render :show, status: :created, location: @attendance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendances/1 or /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to attendance_url(@attendance), notice: "Attendance was successfully updated." }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1 or /attendances/1.json
  def destroy
    @attendance.destroy

    respond_to do |format|
      format.html { redirect_to attendances_url, notice: "Attendance was successfully destroyed." }
      format.json { head :no_content }
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
