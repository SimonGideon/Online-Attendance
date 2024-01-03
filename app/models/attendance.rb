class Attendance < ApplicationRecord
  belongs_to :student
  belongs_to :course
  belongs_to :students_course
  belongs_to :lecturer_unit
end
