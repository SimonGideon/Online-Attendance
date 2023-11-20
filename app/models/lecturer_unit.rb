class LecturerUnit < ApplicationRecord
  belongs_to :lecturer
  belongs_to :course
  has_one_attached :qr_code
end
