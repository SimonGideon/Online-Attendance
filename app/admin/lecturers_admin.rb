Trestle.resource(:lecturers) do
  menu do
    item :lecturers, icon: "fas fa-user-tie"
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :name
    column :service_number
    column :phone
    column :email
    column :created_at, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |lecturer|
    text_field :name
    text_field :service_number
    text_field :phone
    text_field :email

    row do
      col { text_field :password }
      col { text_field :password_confirmation }
    end
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:lecturer).permit(:name, ...)
  # end
end
