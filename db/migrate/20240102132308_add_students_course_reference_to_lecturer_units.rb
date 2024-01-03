class AddStudentsCourseReferenceToLecturerUnits < ActiveRecord::Migration[7.0]
  def change
    add_column :lecturer_units, :students_course, :uuid
    add_index :lecturer_units, :students_course
  end
end
