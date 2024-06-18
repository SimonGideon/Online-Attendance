Trestle.resource(:students) do
  menu do
    item :students, icon: "fas fa-user-graduate"
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :name
    column :email
    column :phone
    column :registraion_number
    column :created_at, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |student|
    text_field :name
    text_field :email
    text_field :phone
    text_field :registraion_number
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:student).permit(:name, ...)
  # end
end
