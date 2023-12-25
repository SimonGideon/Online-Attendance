class LecturerUnit < ApplicationRecord
  belongs_to :lecturer
  belongs_to :course
end
