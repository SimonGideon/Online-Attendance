json.extract! student, :id, :name, :registraion_number, :email, :phone, :created_at, :updated_at
json.url student_url(student, format: :json)
