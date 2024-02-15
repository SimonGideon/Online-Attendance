Trestle.resource(:lecturer_units) do
  menu do
    item :lecturer_units, icon: "fa fa-star"
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
  # form do |lecturer_unit|
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
  #   params.require(:lecturer_unit).permit(:name, ...)
  # end
end
