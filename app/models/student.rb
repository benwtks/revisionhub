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

  validates :email, length: { in: 5..200 },
                    uniqueness: {
                      :case_sensitive => false
                    },
                    presence: true

  validates :username, uniqueness: true,
                       presence: true
  validates :first_name, :last_name ,presence: true,
                                     length: { in: 3..10 }
  validates_format_of :first_name, :last_name, with: /^[a-zA-Z]*$/, multiline: true
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, multiline: true
  validate :validate_username

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      conditions[:email].downcase! if conditions[:email]
      where(conditions.to_h).first
    end
  end

  def validate_username
    if Student.where(email: username).exists?
      errors.add(:username, :invalid)
    end
end
end
