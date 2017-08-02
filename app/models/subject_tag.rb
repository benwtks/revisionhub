class SubjectTag < ApplicationRecord
  has_and_belongs_to_many :subjects
  belongs_to :student
  has_one :tagColour

  validates :name, presence: true,
                   uniqueness: true
end
