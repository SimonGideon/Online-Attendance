class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.string :course_code
      t.integer :lecturer_id, null: true 
      t.timestamps
    end
  end
end
