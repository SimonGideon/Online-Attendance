class LecturerUnit < ApplicationRecord
  belongs_to :lecturer
  belongs_to :course
  has_many :students_courses
end
