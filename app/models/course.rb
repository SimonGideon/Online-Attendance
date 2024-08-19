class Course < ApplicationRecord
  belongs_to :lecturer, dependent: :destroy # Adding dependent: :destroy here
  has_many :students_courses, through: :lecturer_units, dependent: :destroy # Adding dependent: :destroy here
  has_many :students, through: :students_courses, dependent: :destroy # Adding dependent: :destroy here
  has_many :lecturers, through: :lecturer_units
  has_many :lecturer_units, dependent: :destroy # Adding dependent: :destroy here
end
