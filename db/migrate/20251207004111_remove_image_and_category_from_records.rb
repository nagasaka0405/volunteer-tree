class RemoveImageAndCategoryFromRecords < ActiveRecord::Migration[7.1]
  def change
    remove_reference :records, :image
    remove_reference :records, :category
  end
end
