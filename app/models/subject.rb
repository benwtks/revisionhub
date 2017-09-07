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
end
