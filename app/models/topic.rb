class Topic < ApplicationRecord
  belongs_to :subject
  has_many :sessions, dependent: :destroy
  validates :name, presence: true,
                   uniqueness: { scope: "subject_id" },
                   length: { in: 5..30 }

end
