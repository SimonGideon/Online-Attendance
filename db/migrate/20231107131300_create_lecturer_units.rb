class CreateLecturerUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :lecturer_units, id: :uuid do |t|
      t.references :lecturer, type: :uuid, null: false, foreign_key: true
      t.references :course, type: :uuid, null: false, foreign_key: true
      t.timestamps
    end
  end
end
