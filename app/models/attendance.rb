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
        return { success: "Attendance marked successfully" }
      else
        return { error: "Error saving attendance" }
      end
    else
      return { error: "StudentsCourse not found for the given students_course_id" }
    end
  end

  def self.decode_and_verify_token(token)
    secret_key = Rails.application.credentials.secret_key_base
    payload = JWT.decode(token, secret_key, true, algorithm: "HS256")[0]
    payload
  end
end
