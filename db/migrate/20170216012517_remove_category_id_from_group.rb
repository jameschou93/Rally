class RemoveCategoryIdFromGroup < ActiveRecord::Migration[5.0]
  def change
    remove_column :groups, :category_id
  end
end
