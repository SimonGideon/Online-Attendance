json.extract! students_course, :id, :student_id, :course_id, :created_at, :updated_at
json.url students_course_url(students_course, format: :json)
