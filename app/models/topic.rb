class Topic < ApplicationRecord
  belongs_to :subject
  has_many :sessions

  def name_with_subject_name
    return "#{subject.name} - #{name}"
  end
end
