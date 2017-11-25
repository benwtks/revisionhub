class TopicTag < ApplicationRecord
  has_and_belongs_to_many :topics
  belongs_to :student
  belongs_to :tagColour

  validates :name, presence: true,
                   uniqueness: true,
                   length: { in: 2..20 }
end
