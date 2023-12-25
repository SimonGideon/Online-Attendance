class RemoveIdFromAdmins < ActiveRecord::Migration[7.0]
  def change
    remove_column :admins, :id
  end
end
