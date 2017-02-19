class AddAdminToUserGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :user_groups, :admin, :boolean
  end
end
