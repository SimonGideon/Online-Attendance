Trestle.resource(:students_courses) do
  menu do
    item :students_courses, icon: "fa fa-star"
  end

  # Customize the table columns shown on the index view.

  table do
    column :id
    column :student
    column :lecturer_unit, ->(students_courses) { students_courses.lecturer_unit.course.course_name }
    column :created_at, align: :center
    column :updated_at, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |students_course|
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
  #   params.require(:students_course).permit(:name, ...)
  # end
end
