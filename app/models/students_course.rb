class StudentsCourse < ApplicationRecord
  belongs_to :student
  belongs_to :course
  belongs_to :students_course
end
