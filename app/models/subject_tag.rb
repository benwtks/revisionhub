class SubjectTag < ApplicationRecord
  has_and_belongs_to_many :subjects
  belongs_to :student
  belongs_to :tagColour

  default_scope -> { order("created_at ASC") }

  validates :name, presence: true,
                   length: { in: 2..20 }
end
