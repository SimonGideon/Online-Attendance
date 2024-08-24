# db/seeds.rb
Administrator.create(email: "admin@example.com", password: "password", first_name: "Admin", last_name: "User")
# Create 30 Lecturers
30.times do |i|
  Lecturer.create!(
    name: "Lecturer #{i + 1}",
    service_number: "L#{1000 + i + 1}",
    phone: "100000000#{i + 1}",  # 10-digit phone numbers as strings
    work_email: "lecturer#{i + 1}@example.com",
    email: "lecturer#{i + 1}@example.com",
    password: "password123",
  )
end

# Create 100 Students
100.times do |i|
  Student.create!(
    name: "Student #{i + 1}",
    registraion_number: "S#{2000 + i + 1}",
    email: "student#{i + 1}@example.com",
    phone: "200000000#{i + 1}",  # 10-digit phone numbers as strings
    password: "password123",
  )
end
