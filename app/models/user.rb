class User < ActiveRecord::Base

  has_and_belongs_to_many :events, dependent: :destroy
  has_secure_password
  validates :password, presence: true, length: { in: 6..20  }
  validates :first_name, presence: true, allow_blank: false
  validates :last_name, presence: true, allow_blank: false
  validates :email, presence: true, uniqueness: true, 
  									format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "email wrong"}
end
