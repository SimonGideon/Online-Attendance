module QrCodeGeneration
  extend ActiveSupport::Concern

  included do
    def generate_qr_code
      unless self
        # Handle case where lecturer is not found
        return { error: "Lecturer not found" }
      end

      qr = RQRCode::QRCode.new(generate_token, size: 10, level: :l)

      qr_code = qr.as_png(
        bit_depth: 1,
        border_modules: 4,
        color_mode: ChunkyPNG::COLOR_GRAYSCALE,
        color: "black",
        fill: "white",
        module_px_size: 6,
        resize_exactly_to: false,
        resize_gte_to: false,
        size: 200,
      )

      puts "QR code: #{qr_code}"

      # Create ActiveStorage attachment
      self.qr_code.purge if self.qr_code.attached?
      self.qr_code.attach(io: StringIO.new(qr_code.to_s), filename: "qrcode.png", content_type: "image/png")

      { success: "QR code generated successfully" }
    end
  end
end
