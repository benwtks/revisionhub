class Session < ApplicationRecord
  belongs_to :topic
  belongs_to :student

  default_scope -> { order("date DESC, created_at DESC") }

  attr_accessor :hours
  attr_accessor :minutes
  before_save :assign_duration

  def duration_minutes
    return duration.to_i % 60
  end

  def duration_hours
    return (duration.to_i - minutes.to_i) / 60
  end

  def assign_duration
    self.duration = (60 * self.hours.to_i) + self.minutes.to_i
  end
end
