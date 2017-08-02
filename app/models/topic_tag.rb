class TopicTag < ApplicationRecord
  has_and_belongs_to_many :topics
  belongs_to :student
end
