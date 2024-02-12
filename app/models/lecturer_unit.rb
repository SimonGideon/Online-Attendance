class LecturerUnit < ApplicationRecord
  belongs_to :lecturer
  belongs_to :course
  has_many :students_courses

  def course_name_from_lecturer_unit
    course.course_name if course
  end
end
