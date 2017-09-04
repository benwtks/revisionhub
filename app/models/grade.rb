class Grade < ApplicationRecord
  belongs_to :topic
  belongs_to :student
end
