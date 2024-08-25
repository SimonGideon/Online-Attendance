class StudentsController < ApplicationController
  # load_and_authorize_resource
  before_action :authenticate_student!, :set_student, only: %i[ show edit update destroy ]

  # GET /students or /students.json
  def index
    @students = Student.all
  end

  # def dashboard
  #   @students_courses = current_student.students_courses.includes(:lecturer_unit)
  #   @attendances = Attendance.joins(students_course: { lecturer_unit: :course }).where(students_courses: { student_id: current_student.id })
  # end
  def dashboard
    @students_courses = current_student.students_courses.includes(:lecturer_unit)

    # Define the number of learning days per week and the period (5 months from now)
    learning_days_per_week = 5
    start_date = Date.today
    end_date = start_date >> 5  # 5 months from now
    total_days = (end_date - start_date).to_i
    number_of_weeks = (total_days / 7.0).ceil
    expected_attendance_days = number_of_weeks * learning_days_per_week

    # Get all the lecturer units the student is registered in
    lecturer_units = @students_courses.map(&:lecturer_unit).uniq

    # Initialize variables to calculate the total actual attendance days
    total_actual_attendance_days = 0

    lecturer_units.each do |unit|
      students_course = current_student.students_courses.find_by(lecturer_unit_id: unit.id)

      # Count the attendance records for the student in this unit within the given date range
      attended_days = Attendance.where(
        students_course_id: students_course.id,
        attendance_date: start_date..end_date,
        present: true,
      ).count

      total_actual_attendance_days += attended_days
    end

    # Calculate the attendance percentage
    @attendance_percentage = (total_actual_attendance_days.to_f / expected_attendance_days) * 100
    @attendance_percentage = @attendance_percentage.round(3) # Round to 3 decimal places
    @attendances = Attendance.joins(students_course: { lecturer_unit: :course }).where(students_courses: { student_id: current_student.id })
  end

  # GET /students/1 or /students/1.json
  def show
    @student = Student.find(params[:id])
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to student_url(@student), notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to student_url(@student), notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def student_params
    params.require(:student).permit(:name, :registraion_number, :email, :phone, :avatar)
  end
end
