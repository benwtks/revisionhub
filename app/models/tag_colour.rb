class TagColour < ApplicationRecord
  has_many :subject_tags
  has_many :topic_tags
end
