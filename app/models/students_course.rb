class StudentsCourse < ApplicationRecord
  belongs_to :student
  belongs_to :lecturer_unit
end
