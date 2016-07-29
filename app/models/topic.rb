class Topic < ApplicationRecord
  belongs_to :subject
  has_many :sessions, dependent: :destroy
  validates :name, presence: true,
                   uniqueness: { scope: "subject_id" }

  def name_with_subject_name
    return "#{subject.name} - #{name}"
  end
end
