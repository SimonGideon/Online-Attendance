class CreateLecturerUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :lecturer_units do |t|
      t.references :lecturer, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.timestamps
    end
  end
end
