class CreateStudentsCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :students_courses do |t|
      t.references :student, null: false, foreign_key: true
      t.references :lecturer_unit, null: false, foreign_key: true
      t.timestamps
    end
  end
end
