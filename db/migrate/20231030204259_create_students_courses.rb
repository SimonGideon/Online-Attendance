class CreateStudentsCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :students_courses do |t|
      t.references :student, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
