class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances, id: :uuid do |t|
      t.references :student, type: :uuid, null: false, foreign_key: true
      t.references :lecturer_unit, type: :uuid, null: false, foreign_key: true
      t.references :students_course, type: :uuid, null: false, foreign_key: true
      t.date :attendance_date
      t.boolean :present

      t.timestamps
    end
  end
end
