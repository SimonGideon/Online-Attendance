class Attendance < ApplicationRecord
  belongs_to :student
  belongs_to :lecturer_unit
  belongs_to :students_course
end
