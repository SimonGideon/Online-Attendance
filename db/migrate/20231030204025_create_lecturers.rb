class CreateLecturers < ActiveRecord::Migration[7.0]
  def change
    create_table :lecturers do |t|
      t.string :name
      t.string :service_number
      t.string :gender
      t.bigint :phone
      t.string :work_email

      t.timestamps
    end
  end
end
