json.extract! course, :id, :course_name, :course_code, :lecturer_id, :created_at, :updated_at
json.url course_url(course, format: :json)
