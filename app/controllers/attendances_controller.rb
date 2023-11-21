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

  # mark attendance decode
  def mark_attendance
    token = params[:token]

    # Ensure the token is provided
    if token.blank?
      render json: { error: "Token is missing" }, status: :unprocessable_entity
      return
    end

    begin
      #decode jwt token
      payload = JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: "HS256")[0]
      lecturer_unit_id = payload["lecturer_unit_id"]
      lecturer_unit = LecturerUnit.find_by(id: lecturer_unit_id)

      if lecturer_unit
        Attendance.create(student_id: current_student.id, ecturer_unit_id: lecturer_unit_id)
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
    @attendance = Attendance.new(attendance_params)

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
    params.require(:attendance).permit(:student_id, :lecturer_unit_id, :attendance_date, :present)
  end
end
