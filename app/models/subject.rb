class Subject < ApplicationRecord
  belongs_to :student
  has_many :topics
  validates_uniqueness_of :name, scope: "student_id"
end
