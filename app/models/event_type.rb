class EventType < ApplicationRecord
    has_many :record_event_types
    has_many :records, through: :record_event_types
end

class Record < ApplicationRecord
    has_many :record
