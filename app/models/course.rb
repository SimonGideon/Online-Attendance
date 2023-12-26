class Course < ApplicationRecord
  has_one :lecturer
  has_and_belongs_to_many :students, join_table: 'students_courses'
  has_many :students_courses
  has_many :students, through: :students_courses
  has_many :lecturer_courses
end
