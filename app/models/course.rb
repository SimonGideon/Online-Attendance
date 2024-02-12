class Course < ApplicationRecord
  belongs_to :lecturer
  has_many :students_courses
  has_many :students, through: :students_courses
  has_many :lecturer_units
end
