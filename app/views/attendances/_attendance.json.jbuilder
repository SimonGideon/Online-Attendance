json.extract! attendance, :id, :students_course_id, :attendance_date, :present, :created_at, :updated_at
json.url attendance_url(attendance, format: :json)
