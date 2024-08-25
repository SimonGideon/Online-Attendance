class LecturersController < ApplicationController
  # load_and_authorize_resource
  before_action :set_lecturer, only: %i[show edit update destroy]
  before_action :authenticate_lecturer!, only: %i[show edit update destroy generate_qr_code]

  # GET /lecturers or /lecturers.json
  def index
    @lecturers = Lecturer.all
  end

  def dashboard
    @lecturer = current_lecturer

    if @lecturer.nil?
      redirect_to login_path, alert: "Please log in to access the dashboard."
      return
    end

    @lecturer_units = @lecturer.lecturer_units
    @courses = @lecturer.courses

    @attendance_data = {}

    @lecturer_units.each do |lecturer_unit|
      lecturer_unit.students_courses.each do |students_course|
        Attendance.where(students_course_id: students_course.id).each do |attendance|
          date = attendance.attendance_date.strftime("%Y-%m-%d")
          @attendance_data[date] ||= 0
          @attendance_data[date] += 1 if attendance.present?
        end
      end
    end

    authorize! :read, @lecturer

    if @lecturer.qr_code.attached?
      puts "QR code attached"
    else
      puts "QR code not attached"
    end
    puts "This is the current: #{@lecturer}"

    @allocated_units_count = LecturerUnit.where(lecturer_id: current_lecturer.id).count
    @total_students_count = StudentsCourse.where(lecturer_unit_id: current_lecturer.lecturer_units.pluck(:id)).count
  end

  # GET /lecturers/1 or /lecturers/1.json
  def show
    authorize! :read, @lecturer
  end

  # GET /lecturers/new
  def new
    @lecturer = Lecturer.new
  end

  # GET /lecturers/1/edit
  def edit
  end

  # POST /lecturers or /lecturers.json
  def create
    @lecturer = Lecturer.new(lecturer_params)

    respond_to do |format|
      if @lecturer.save
        format.html { redirect_to lecturer_url(@lecturer), notice: "Lecturer was successfully created." }
        format.json { render :show, status: :created, location: @lecturer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lecturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lecturers/1 or /lecturers/1.json
  def update
    respond_to do |format|
      if @lecturer.update(lecturer_params)
        format.html { redirect_to lecturer_url(@lecturer), notice: "Lecturer was successfully updated." }
        format.json { render :show, status: :ok, location: @lecturer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lecturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lecturers/1 or /lecturers/1.json
  def destroy
    @lecturer.destroy

    respond_to do |format|
      format.html { redirect_to lecturers_url, notice: "Lecturer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def generate_token
    secret_key = Rails.application.credentials.secret_key_base
    token = JWT.encode({ lecturer_id: current_lecturer.id }, secret_key, "HS256")
    return token
  end

  # generate QR code with token
  def generate_qr_code
    result = current_lecturer.generate_qr_code

    if result[:error]
      Rails.logger.error "QR Code Generation Error: #{result[:error]}"
      flash[:error] = result[:error]
    else
      flash[:notice] = result[:success]
    end
    redirect_to lecturer_path(current_lecturer)
  end

  # individual lecturer attendance
  def lecturer_attendance
    @attendances = Attendance.joins(students_course: { lecturer_unit: :lecturer })
                             .where(lecturers: { id: current_lecturer.id })

    if params[:course].present?
      @attendances = @attendances.joins(students_course: { lecturer_unit: :course })
                                 .where(courses: { course_name: params[:course] })
    end

    if params[:student].present?
      @attendances = @attendances.joins(students_course: :student)
                                 .where(students: { name: params[:student] })
    end

    if params[:sort].present?
      case params[:sort]
      when "course_name"
        @attendances = @attendances.joins(students_course: { lecturer_unit: :course })
                                   .order("courses.course_name")
      when "student_name"
        @attendances = @attendances.joins(students_course: :student)
                                   .order("students.name")
      when "attendance_date"
        @attendances = @attendances.order("attendance_date")
      end
    end
    respond_to do |format|
      format.html
      format.json { render json: @attendances }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lecturer
    @lecturer = Lecturer.find(params[:id])
  end

  def lecturer_params
    params.require(:lecturer).permit(:name, :service_number, :phone, :work_email, :avatar)
  end
end
