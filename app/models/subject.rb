class Subject < ApplicationRecord
  belongs_to :student
  has_many :topics, dependent: :destroy
  has_many :grades
  has_and_belongs_to_many :subjectTags
  validates :name, length: { in: 2..30 },
                   presence: true,
                   uniqueness: { scope: "student_id" }
  validates :teacher, presence: true,
                      length: { in: 2..50 }

  default_scope -> { order("created_at ASC") }

  scope :filter, ->(name){
    joins(:subjectTags).where(subject_tags: { name: name }) if name.present?
  }

  def no_sessions(range="all")
    i = 0
    topics.each do |topic|
      if range == "week"
        i += topic.sessions.where(date: Chronic.parse('monday', context: :past) .. Time.now).count
      elsif range == "all"
        i += topic.sessions.count
      end
    end

    return i
  end

  def session_duration_total(range="all")
    cumulative_hours = 0
    cumulative_minutes = 0

    topics.each do |topic|
      if range == "week"
        topic.sessions.where(date: Chronic.parse('monday', context: :past) .. Time.now).each do |session|
          cumulative_hours += session.duration_hours
          cumulative_minutes += session.duration_minutes
        end
      elsif range == "all"
        topic.sessions.each do |session|
          cumulative_hours += session.duration_hours
          cumulative_minutes += session.duration_minutes
        end
      end
    end

    return [cumulative_hours, cumulative_minutes]
  end

  def target_progress
    duration = self.session_duration_total('week')
    return duration[0].round(5)/self.target.round(5)
  end

  def target_amount_to_offset
    return 1 - self.target_progress
  end

  def target_data
    return "#{(self.target_progress * 100).round(0)}%"
  end
end
