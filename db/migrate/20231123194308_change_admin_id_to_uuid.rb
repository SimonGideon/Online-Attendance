class ChangeAdminIdToUuid < ActiveRecord::Migration[7.0]
  def change
  change_table :admins do |t|
    t.uuid :id, default: -> { "gen_random_uuid()" }, primary_key: true
  end
end
end
