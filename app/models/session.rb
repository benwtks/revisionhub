class Session < ApplicationRecord
  belongs_to :topic
  belongs_to :student

  attr_accessor :hours
  attr_accessor :minutes

  default_scope -> { order("date DESC, created_at DESC") }
end
