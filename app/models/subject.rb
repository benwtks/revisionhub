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

  def hyphenated_name
    words = self.name.downcase.split(" ")
    hyphenated = "#{words[0]}"
    words.drop(1).each do |word|
      hyphenated += "-#{word}"
    end

    return hyphenated
  end

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
    cumulative_total = 0

    topics.each do |topic|
      if range == "week"
        topic.sessions.where(date: Chronic.parse('monday', context: :past) .. Time.now).each do |session|
          cumulative_total += session.duration
        end
      elsif range == "all"
        topic.sessions.each do |session|
          cumulative_total += session.duration_hours
        end
      end
    end

    cumulative_minutes = cumulative_total % 60
    cumulative_hours = (cumulative_total - cumulative_minutes) / 60

    return [cumulative_hours, cumulative_minutes, cumulative_total]
  end

  def target_progress
    duration = self.session_duration_total('week')[2].to_f
    target_in_mins = (self.target.to_f * 60)

    return duration/target_in_mins
  end

  def target_amount_to_offset
    if self.target_progress > 1
      return 0
    else
      return (1 - self.target_progress) * 324.75
    end
  end

  def target_data
    return "#{(self.target_progress * 100).round(0)}%"
  end
end
