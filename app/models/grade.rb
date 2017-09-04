class Grade < ApplicationRecord
  belongs_to :topic, optional: true
  belongs_to :student
end
