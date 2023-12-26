class StudentsCoursesController < ApplicationController
  load_and_authorize_resource
  before_action :set_students_course, only: %i[ show edit update destroy ]

  # GET /students_courses or /students_courses.json
  def index
    @students_courses = StudentsCourse.all
  end

  # GET /students_courses/1 or /students_courses/1.json
  def show
  end

  # GET /students_courses/new
  def new
    @students_course = StudentsCourse.new
    @available_courses = available_courses_for_current_student
  end

  # GET /students_courses/1/edit
  def edit
  end

  # POST /students_courses or /students_courses.json
  def create
    @students_course = StudentsCourse.new(students_course_params)

    respond_to do |format|
      if @students_course.save
        format.html { redirect_to student_students_courses_url(@students_course), notice: "Students course was successfully created." }
        format.json { render :show, status: :created, location: @students_course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @students_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students_courses/1 or /students_courses/1.json
  def update
    respond_to do |format|
      if @students_course.update(students_course_params)
        format.html { redirect_to student_students_courses_url(@students_course), notice: "Students course was successfully updated." }
        format.json { render :show, status: :ok, location: @students_course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @students_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students_courses/1 or /students_courses/1.json
  def destroy
    @students_course.destroy

    respond_to do |format|
      format.html { redirect_to students_courses_url, notice: "Students course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def available_courses_for_current_student
    current_student_course_ids = current_student.courses.pluck(:id)
    Course.where.not(id: current_student_course_ids)
  end
  

  # Use callbacks to share common setup or constraints between actions.
  def set_students_course
    @students_course = StudentsCourse.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def students_course_params
    student_id = current_student.id if current_student
    params.require(:students_course).permit(:course_id).merge(student_id: student_id)
  end
end
