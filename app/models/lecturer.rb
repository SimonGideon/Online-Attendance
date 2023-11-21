class Lecturer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :courses
  has_many :students, through: :courses
  has_many :lecturer_courses
  has_many :attendances
  has_one_attached :avatar
end
