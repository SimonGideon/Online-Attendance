class Student < ApplicationRecord
    has_and_belongs_to_many :courses
    has_many :lecturers, through: :courses
end
