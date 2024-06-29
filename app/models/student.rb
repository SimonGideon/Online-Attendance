class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_and_belongs_to_many :courses, join_table: "students_courses"
  has_many :lecturers, through: :courses
  has_many :attendances
  has_one_attached :avatar
  has_many :students_courses
end
