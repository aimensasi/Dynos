class User < ActiveRecord::Base

  has_and_belongs_to_many :events
  has_secure_password
  validates :password, presence: true, confirmation: true, length: { in: 6..20  }
  validates :password_confirmation, presence: true
  validates :first_name, presence: true, allow_blank: false
  validates :last_name, presence: true, allow_blank: false
  validates :email, presence: true, uniqueness: true,confirmation: { case_sensitive: false }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "email wrong"}
end
