class LecturerUnit < ApplicationRecord
  belongs_to :lecturer, dependent: :destroy # Adding dependent: :destroy here
  belongs_to :course, dependent: :destroy # Adding dependent: :destroy here

  has_many :students_courses, dependent: :destroy # Adding dependent: :destroy here

  def course_name_from_lecturer_unit
    course.course_name if course
  end
end
