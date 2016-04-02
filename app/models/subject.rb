class Subject < ActiveRecord::Base
  def to_param
    Base64.urlsafe_encode64 self.id.to_s
  end

  has_many :topics
end
