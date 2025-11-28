class CreateRecordEventTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :record_event_types do |t|
      t.references :record, null: false, foreign_key: true
      t.references :event_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
