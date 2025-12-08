
class Record < ApplicationRecord
    belongs_to :user
    has_one_attached :photo
    belongs_to :prefecture
    has_many :comments, dependent: :destroy

    has_many :record_event_types, dependent: :destroy
    has_many :event_types, through: :record_event_types

    enum status: { draft: 0, published: 1 }

    validates :star_rating,  inclusion: { in: 1..5 }
end