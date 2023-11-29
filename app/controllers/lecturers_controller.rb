class LecturersController < ApplicationController
  # load_and_authorize_resource
  before_action :authenticate_lecturer!, :set_lecturer, only: %i[ show edit update destroy ]

  # GET /lecturers or /lecturers.json
  def index
    @lecturers = Lecturer.all
  end

  # GET /lecturers/1 or /lecturers/1.json
  def show
    @lecturer = Lecturer.find(params[:id])
    authorize! :read, @lecturer
    if @lecturer.qr_code.attached?
      puts "QR code attached"
    else
      # Handle the case where qr_code is not attached
      puts "QR code not attached"
    end
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
    puts "THis is ====================", token
    return token
  end

  # generate QR code with token
  def generate_qr_code
    qr = RQRCode::QRCode.new(generate_token, size: 12, level: :h)
    @lecturer = current_lecturer

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
    params.require(:lecturer).permit(:name, :service_number, :phone, :work_email, :avatar)
  end
end
