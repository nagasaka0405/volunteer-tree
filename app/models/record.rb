
class Record < ApplicationRecord
    belongs_to :user
    has_one_attached :photo
    belongs_to :prefecture
    has_many :comments, dependent: :destroy

    has_many :record_event_types, dependent: :destroy
    has_many :event_types, through: :record_event_types
    has_many :favorites, dependent: :destroy

    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end

    enum status: { published: 0, draft: 1 }

    validates :star_rating, presence: true, inclusion: { in: 1..5 }
    validates :event_name, presence: true, length: { maximum: 20 }
    validates :prefecture_id, presence: true
    validates :content, presence: true, length: { maximum: 195 }
    validates :event_types, presence: true
end