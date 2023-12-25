module CoursesHelper
  def lec_name(id)
    lecturer = Lecturer.find(id)
    lecturer.name
  end
end
