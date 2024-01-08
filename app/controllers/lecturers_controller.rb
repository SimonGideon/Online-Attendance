class LecturersController < ApplicationController
  # load_and_authorize_resource
  before_action :set_lecturer, only: %i[show edit update destroy]
  before_action :authenticate_lecturer!, only: %i[show edit update destroy generate_qr_code]

  # GET /lecturers or /lecturers.json
  def index
    @lecturers = Lecturer.all
  end

  # GET /lecturers/1 or /lecturers/1.json
  def show
    authorize! :read, @lecturer
    if @lecturer.qr_code.attached?
      puts "QR code attached"
    else
      # Handle the case where qr_code is not attached
      puts "QR code not attached"
    end
    puts "This is the current: #{current_lecturer.id}"
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
    puts "Current User:", current_lecturer.id
    return token
  end

  # generate QR code with token
  def generate_qr_code
    # Ensure current_lecturer is present
    unless current_lecturer
      flash[:error] = "Lecturer not found. Please make sure you are logged in."
      redirect_to root_path and return
    end

    qr = RQRCode::QRCode.new(generate_token, size: 10, level: :l)

    # Generate the QR code image
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
      size: 200,
    )

    puts "QR Code:", qr_code

    # Check if the lecturer already has a QR code attached
    if current_lecturer.qr_code.attached?
      # If it does, delete the existing QR code
      current_lecturer.qr_code.purge
      puts "QR code purged!!!+==========="
    end

    # Attach the new QR code to the active storage
    current_lecturer.qr_code.attach(io: StringIO.new(qr_code.to_s),
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
