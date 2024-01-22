class Lecturer < ApplicationRecord
  include TokenGeneration
  include QrCodeGeneration
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :courses
  has_many :students_courses, through: :lecturer_units
  has_many :lecturer_units
  has_many :attendances
  has_one_attached :avatar
  has_one_attached :qr_code

  def lecturer_params
    params.require(:lecturer).permit(:name, :service_number, :phone, :work_email, :avatar)
  end
end
