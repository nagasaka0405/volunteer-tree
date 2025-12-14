class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :record

    validates :comment, presence: true, length: { maximun: 35 }
end
