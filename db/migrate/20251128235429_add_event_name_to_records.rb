class AddEventNameToRecords < ActiveRecord::Migration[7.1]
  def change
    add_column :records, :event_name, :string
  end
end
