class Lecturer < ApplicationRecord
  # Associations
  has_many :courses
  has_many :lecturer_units
  has_many :attendances
  has_many :students_courses, through: :lecturer_units
  has_one_attached :avatar
  has_one_attached :qr_code

  # Devise configuration
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # Includes
  include TokenGeneration
  include QrCodeGeneration

  # Other methods...

  # Strong parameters for lecturer
  def lecturer_params
    params.require(:lecturer).permit(:name, :service_number, :phone, :work_email, :avatar)
  end
end
