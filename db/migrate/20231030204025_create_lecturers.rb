class CreateLecturers < ActiveRecord::Migration[7.0]
  def change
    create_table :lecturers, id: :uuid do |t|
      t.string :name
      t.string :service_number
      t.bigint :phone
      t.string :work_email

      t.timestamps
    end
  end
end
