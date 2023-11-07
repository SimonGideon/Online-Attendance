json.extract! attendance, :id, :student_id, :lecturer_unit_id, :attendance_date, :present, :created_at, :updated_at
json.url attendance_url(attendance, format: :json)
