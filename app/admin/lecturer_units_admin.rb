Trestle.resource(:lecturer_units) do
  menu do
    item :lecturer_units, icon: "fas fa-id-card"
  end
  # column :id
  # column :lecturer

  table do
    column :id
    column :lecturer
    column :course_id, ->(lecturer_unit) {lecturer_unit.course.course_name}
    column :created_at, align: :center
    column :updated_at, align: :center
    column :students_courses, ->(lecturer_unit) {lecturer_unit.students_courses.count}, align: :center
      actions
  end


  # Customize the table columns shown on the index view.
  #
  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  # Customize the form fields shown on the new/edit views.
  #
  form do |lecturer_unit|
    select :lecturer_id, options_for_select(Lecturer.all.map { |lecturer| [lecturer.name, lecturer.id] }), label: "Lecturer"
    select :course_id, options_for_select(Course.all.map { |course| [course.course_name, course.id] }), label: "Course"
    concat(content_tag(:ol) do # Added class list-unstyled for removing default list styles
      lecturer_unit.students_courses.each do |students_course|
        student = students_course.student # Assuming there is a student association
        concat(content_tag(:li, class: "d-flex justify-content-between align-items-center mb-2 border-bottom") do # Added classes for flex layout and margin-bottom
          concat(content_tag(:span, student.name)) # Assuming the student has a name attribute
          concat(button_to("Delete", "/students/#{student.id}/students_courses/#{students_course.id}", method: :delete, data: { confirm: "Are you sure you want to delete this student?" }, class: "btn btn-danger mb-2"))
        end)
      end
    end)
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:lecturer_unit).permit(:name, ...)
  # end
end
