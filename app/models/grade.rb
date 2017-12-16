class Grade < ApplicationRecord
  belongs_to :topic, optional: true
  belongs_to :subject
  belongs_to :student
  before_save :assign_student

  def assign_student
    self.student_id = self.subject.student.id
  end
end
