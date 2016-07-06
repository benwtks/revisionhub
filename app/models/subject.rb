class Subject < ActiveRecord::Base
  belongs_to :student
  has_many :topics
end
