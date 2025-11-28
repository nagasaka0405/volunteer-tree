class RecordEventType < ApplicationRecord
  belongs_to :record
  belongs_to :event_type
end
