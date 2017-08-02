class SubjectTag < ApplicationRecord
  has_and_belongs_to_many :subjects
  belongs_to :student
end
