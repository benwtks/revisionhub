class Subject < ApplicationRecord
  belongs_to :student
  has_many :topics, dependent: :destroy
  validates :name, length: { in: 5..30 },
                   presence: true,
                   uniqueness: { scope: "student_id" }
  validates :teacher, presence: true,
                      length: { in: 5..50 }
end
