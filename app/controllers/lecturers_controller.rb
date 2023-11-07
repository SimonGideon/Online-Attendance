class LecturersController < ApplicationController
  before_action :set_lecturer, :authenticate_lecturer!, only: %i[ show edit update destroy ]

  # GET /lecturers or /lecturers.json
  def index
    @lecturers = Lecturer.all
  end

  # GET /lecturers/1 or /lecturers/1.json
  def show
    @lecturer = Lecturer.find(params[:id])
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

  # Define the "generate_qr_code" action as a public method
  def generate_qr_code
    @lecturer = Lecturer.find(params[:id])
    qr = RQRCode::QRCode.new(@lecturer.id.to_s, size: 4, level: :h)
    puts qr.to_s

    # Generate the QR code image and save it as a file
    qr_code = qr.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120,
    )
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lecturer
    @lecturer = Lecturer.find(params[:id])
  end

  # if something_is_not_kosher
  #   redirect_to sign_out_path and return
  # end
  # Only allow a list of trusted parameters through.

  def lecturer_params
    params.require(:lecturer).permit(:name, :service_number, :phone, :work_email)
  end
end
