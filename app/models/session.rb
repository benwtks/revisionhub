class Session < ApplicationRecord
  belongs_to :topic
  belongs_to :student

  default_scope -> { order("date DESC, created_at DESC") }
end
