class Subject < ApplicationRecord
  belongs_to :student
  has_many :topics, dependent: :destroy
  validates_presence_of :name, :teacher
  validates :name, length: { in: 5..30 }
  validates_uniqueness_of :name, scope: "student_id"
end
