
class Record < ApplicationRecord
    belongs_to :user
    belongs_to :image
    belongs_to :prefecture
    has_many :record_event_types, dependent: :destroy
    has_many :event_types, through: :record_event_types

    enum status: { draft: 0, published: 1 }

    validates :star_rating,  inclusion: { in: 1..5 }
end