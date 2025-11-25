class Record < ApplicationRecord
    belongs_to :user
    belongs_to :image
    belongs_to :category

    enum status: { draft: 0, published: 1 }

    validates :star_rating,  inclusion: { in: 1..5 }
end
