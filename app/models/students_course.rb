class StudentsCourse < ApplicationRecord
  belongs_to :student
  belongs_to :course
  belongs_to :attendance
  has_many :lecturer_units
end
