class Topic < ApplicationRecord
  belongs_to :subject
  belongs_to :student
  has_many :sessions, dependent: :destroy
  has_and_belongs_to_many :topicTags
  validates :name, presence: true,
                   uniqueness: { scope: "subject_id" },
                   length: { in: 3..30 }
end
