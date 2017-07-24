class Topic < ApplicationRecord
  belongs_to :subject
  belongs_to :student
  has_many :sessions, dependent: :destroy
  validates :name, presence: true,
                   uniqueness: { scope: "subject_id" },
                   length: { in: 3..30 }

  validates :description, length: { in: 0..200 }
end
