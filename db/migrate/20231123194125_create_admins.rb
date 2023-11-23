class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.string :work_email
      t.string :designation
      t.string :names
      t.boolean :super_admin

      t.timestamps
    end
  end
end
