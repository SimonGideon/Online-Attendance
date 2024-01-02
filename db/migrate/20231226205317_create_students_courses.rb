class CreateStudentsCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :students_courses, id: :uuid do |t|
      t.references :student, type: :uuid, null: false, foreign_key: true
      t.references :lecturer_unit, type: :uuid, null: false, foreign_key: true
      t.timestamps
    end
  end
end
