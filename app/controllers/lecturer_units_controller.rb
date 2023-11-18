class LecturerUnitsController < ApplicationController
  before_action :set_lecturer_unit, only: %i[ show edit update destroy ]

  def current_lec_units
    lecturer_id = current_lecturer.id
    @lecturer_units = LecturerUnit.where(lecturer_id: lecturer_id)
  end

  # GET /lecturer_units or /lecturer_units.json
  def index
    @lecturer_units = LecturerUnit.all
    render json: @lecturer_units
  end

  def generate_token
    lecturer_unit_id = @lecturer_units.id
    secret_key = Rails.application.secrets.secret_key_base

    @token = JWT.encode({ lecturer_unit_id: lecturer_unit_id }, secret_key, "HS256")
    render json: { token: token }
  end

  # generate QR code with token
  def generate_qr_code
    qr = RQRCode::QRCode.new(@token, size: 4, level: :h)

    # Generate the QR code image and save it as a file
    qr_code = qr.as_png(
      resize_exactly_to: 120,
      module_px_size: 6,
      file: nil,
    )

    # Attach the QR code to the active storage
    @lecturer.qr_code.attach(io: StringIO.new(qr_code.to_s),
                             filename: "qrcode.png",
                             content_type: "image/png")
  end

  # GET /lecturer_units/1 or /lecturer_units/1.json
  def show
  end

  # GET /lecturer_units/new
  def new
    @lecturer_unit = LecturerUnit.new
  end

  # GET /lecturer_units/1/edit
  def edit
  end

  # POST /lecturer_units or /lecturer_units.json
  def create
    @lecturer_unit = LecturerUnit.new(lecturer_unit_params)

    respond_to do |format|
      if @lecturer_unit.save
        format.html { redirect_to lecturer_unit_url(@lecturer_unit), notice: "Lecturer unit was successfully created." }
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
    @lecturer_unit = LecturerUnit.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def lecturer_unit_params
    params.require(:lecturer_unit).permit(:lecturer_id, :course_id, :qr_code)
  end
end