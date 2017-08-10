class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :subjects
  has_many :topics
  has_many :sessions
  has_many :subjectTags
  has_many :topicTags

  validates :email, length: { in: 5..200 }
  validates :username, uniqueness: true

  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
