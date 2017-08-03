class SubjectTag < ApplicationRecord
  has_and_belongs_to_many :subjects
  belongs_to :student
  belongs_to :tagColour

  validates :name, presence: true,
                   uniqueness: true
end
