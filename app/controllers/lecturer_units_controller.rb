class LecturerUnitsController < ApplicationController
  load_and_authorize_resource
  before_action :set_lecturer_unit
  # def current_lec_units
  #   lecturer_id = current_lecturer.id
  #   @lecturer_units = params[:id]

  #   if @lecturer_units
  #     render json: @lecturer_units
  #   else
  #     render json: { error: "No lecturer units found for the current lecturer" }, status: :not_found
  #   end
  # end

  # GET /lecturer_units or /lecturer_units.json
  def index
    @lecturer_units = LecturerUnit.where(lecturer_id: current_lecturer.id)
  end

  # GET /lecturer_units/1 or /lecturer_units/1.json
  def show
  end

  # GET /lecturer_units/new
  def new
    @lecturer_unit = LecturerUnit.new
    @available_courses = available_courses_for_current_lecturer
  end

  # GET /lecturer_units/1/edit
  def edit
  end

  # POST /lecturer_units or /lecturer_units.json
  def create
    @lecturer_unit = LecturerUnit.new(lecturer_unit_params)

    respond_to do |format|
      if @lecturer_unit.save
        format.html { redirect_to lecturer_lecturer_units_url(@lecturer_unit), notice: "Lecturer unit was successfully created." }
        format.json { render :show, status: :created, location: @lecturer_unit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lecturer_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lecturer_units/1 or /lecturer_units/1.json
  def update
    respond_to do |format|
      if @lecturer_unit.update(lecturer_unit_params)
        format.html { redirect_to lecturer_unit_url(@lecturer_unit), notice: "Lecturer unit was successfully updated." }
        format.json { render :show, status: :ok, location: @lecturer_unit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lecturer_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lecturer_units/1 or /lecturer_units/1.json
  def destroy
    @lecturer_unit.destroy

    respond_to do |format|
      format.html { redirect_to lecturer_units_url, notice: "Lecturer unit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lecturer_unit
    @lecturer_unit = LecturerUnit.first
  end

  def available_courses_for_current_lecturer
    current_lecturer_course_ids = current_lecturer.courses.pluck(:id)
    Course.where(id: current_lecturer_course_ids)
  end

  # Only allow a list of trusted parameters through.
  def lecturer_unit_params
    params.require(:lecturer_unit).permit(:lecturer_id, :course_id).merge(lecturer_id: current_lecturer.id)
  end
end
