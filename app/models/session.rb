class Session < ApplicationRecord
  belongs_to :topic
  belongs_to :student
end
