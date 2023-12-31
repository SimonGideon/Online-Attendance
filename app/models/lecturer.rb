class Lecturer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :courses
  has_many :students, through: :students_courses
  has_many :lecturer_units
  has_many :attendances
  has_one_attached :avatar
  has_one_attached :qr_code
end
