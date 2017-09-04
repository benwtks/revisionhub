class Topic < ApplicationRecord
  belongs_to :subject
  belongs_to :student
  has_many :sessions, dependent: :destroy
  has_many :grades
  has_and_belongs_to_many :topicTags
  validates :name, presence: true,
                   uniqueness: { scope: "subject_id" },
                   length: { in: 3..40 }

  def session_percentage
    percentage = (sessions.count.round(2) / subject.session_count.round(2)) * 100
    "#{percentage.round(2)}%"
  end
end
