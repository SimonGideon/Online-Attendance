module TokenGeneration
    extend ActiveSupport::Concern
  
    included do
      def generate_token
        secret_key = Rails.application.credentials.secret_key_base
        JWT.encode({ lecturer_id: id }, secret_key, "HS256")
      end
    end
  end
  