class RemoveCategoryIdFromRecords < ActiveRecord::Migration[7.1]
  def change
    if foreign_key_exists?(:records, :categories)
      remove_foreign_key :records, :categories
    end
    if column_exists?(:records, :category_id)
      remove_column :records, :category_id, :integer
    end
  end
end
