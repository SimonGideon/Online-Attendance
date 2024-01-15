class Attendance < ApplicationRecord
  belongs_to :students_course

  private

  def self.create_attendance(my_student_course_id)
    students_course = StudentsCourse.find_by(id: my_student_course_id)
    if students_course
      attendance = Attendance.find_or_create_by(
        students_course: students_course,
        attendance_date: Date.today,
      ) do |attendance|
        attendance.present = true
      end

      if attendance.persisted?
        puts "Attendance marked successfully"
        render json: { message: "Attendance marked successfully" }
      else
        render json: { error: "Error saving attendance" }, status: :unprocessable_entity
      end
    else
      render json: { error: "StudentsCourse not found for the given students_course_id" }, status: :unprocessable_entity
    end
  end
end
