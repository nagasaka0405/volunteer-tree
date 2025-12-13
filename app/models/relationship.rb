class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "USER"
  belongs_to :followed, class_name: "User"
end
