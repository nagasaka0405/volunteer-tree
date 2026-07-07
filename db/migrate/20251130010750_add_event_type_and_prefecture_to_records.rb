class AddEventTypeAndPrefectureToRecords < ActiveRecord::Migration[7.1]
  def change
    add_reference :records, :event_type, null: false, foreign_key: true
  end
end