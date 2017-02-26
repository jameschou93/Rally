class AddBioToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :bio, :text
  end
end
