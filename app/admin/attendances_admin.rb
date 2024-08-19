Trestle.resource(:attendances) do
  menu do
    item :attendances, icon: "fas fa-chalkboard-teacher"
  end

  # Customize the table columns shown on the index view.

  # table do
  #   column :id
  #   column :student do |attendance|
  #     "#{attendance.students_course.student.name}"
  #   end
  #   column :course do |attendance|
  #     attendance.students_course.course.course_name
  #   end
  #   column :lecturer do |attendance|
  #     attendance.lecturer.first_name
  #   end
  #   column :attendance_date
  #   column :attendance_present
  #   column :created_at, align: :center
  #   actions
  # end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |attendance|
  #   text_field :name
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  # end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:attendance).permit(:name, ...)
  # end
end
