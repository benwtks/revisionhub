class Session < ApplicationRecord
  belongs_to :topic
  belongs_to :student

  def name
    "#{topic.subject.name.capitalize}: #{topic.name.capitalize}"
  end
end
