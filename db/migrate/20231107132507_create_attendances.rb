class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.references :student, null: false, foreign_key: true
      t.references :lecturer_unit, null: false, foreign_key: true
      t.date :attendance_date
      t.boolean :present

      t.timestamps
    end
  end
end
