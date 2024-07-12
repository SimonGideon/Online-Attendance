class StudentsCourse < ApplicationRecord
  belongs_to :student, dependent: :destroy
  belongs_to :lecturer_unit, dependent: :destroy
  has_many :attendances, dependent: :destroy
end
