class Attendance < ApplicationRecord
  belongs_to :students_course

  private
  def self.mark_attendance(lecturer_id, current_student)
    lecturer = Lecturer.find_by(id: lecturer_id)

    if lecturer
      my_student_courses = lecturer.lecturer_units.flat_map(&:students_courses).uniq.select { |course| course.student_id == current_student.id }

      if my_student_courses.size > 1
        return { multiple_courses: my_student_courses }
      elsif my_student_courses.size == 1
        students_course_id = my_student_courses.first&.id
        return create_attendance(students_course_id)
      else
        return { error: "No matching courses found" }
      end
    else
      return { error: "Lecturer not found for the given lecturer_id" }
    end
  end

  def self.create_attendance(my_student_course_id)
    students_course = StudentsCourse.find_by(id: my_student_course_id)
    if students_course
      puts "===========>StudentsCourse found for the given students_course_id"
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
    puts "=======Secret Key: #{secret_key}"
    payload = JWT.decode(token, secret_key, true, algorithm: "HS256")[0]
    puts "=======Payload: #{payload}"
    return payload
  rescue JWT::DecodeError => e
    puts "JWT decode error: #{e.message}"
    return nil
  rescue JWT::VerificationError => e
    puts "JWT verification error: #{e.message}"
    return nil
  rescue => e
    puts "Error decoding/verifying token: #{e.message}"
    return nil
  end
end
