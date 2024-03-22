class StudentsCourse < ApplicationRecord
  belongs_to :student, dependent: :destroy # Adding dependent: :destroy here
  belongs_to :lecturer_unit, dependent: :destroy # Adding dependent: :destroy here
end
