class TopicTag < ApplicationRecord
  has_and_belongs_to_many :topics
  belongs_to :student
  has_one :tagColour

  validates :name, presence: true,
                   uniqueness: true
end
