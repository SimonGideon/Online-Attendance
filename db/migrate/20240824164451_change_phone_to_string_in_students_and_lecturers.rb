class ChangePhoneToStringInStudentsAndLecturers < ActiveRecord::Migration[7.0]
  def change
    change_column :students, :phone, :string
    change_column :lecturers, :phone, :string
  end
end
