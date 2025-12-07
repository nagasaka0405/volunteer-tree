class RemoveEventTypeIdFromRecords < ActiveRecord::Migration[7.1]
  def change
    remove_column :records, :event_type_id, :integer
  end
end
