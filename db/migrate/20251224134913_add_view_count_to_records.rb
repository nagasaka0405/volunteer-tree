class AddViewCountToRecords < ActiveRecord::Migration[7.1]
  def change
    add_column :records, :view_count, :integer
  end
end
