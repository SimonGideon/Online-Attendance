class AddCourseRefToAttendances < ActiveRecord::Migration[7.0]
  def change
    add_reference :attendances, :course, foreign_key: true
  end
end
