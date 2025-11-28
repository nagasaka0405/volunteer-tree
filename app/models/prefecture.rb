class Prefecture < ApplicationRecord
    has_many :records
end

class Record < ApplicationRecord
    belongs_to :prefecture
end