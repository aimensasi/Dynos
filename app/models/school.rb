class School < ActiveRecord::Base


  has_secure_password
  has_many :events, dependent: :destroy
  # has_many :statuses, dependent: :destroy

  validates :password, presence: true, confirmation: true, length: { in: 6..20  }
  validates :password_confirmation, presence: true
  validates :name, presence: true, allow_blank: false
  validates :email, presence: true, uniqueness: true,confirmation: { case_sensitive: false }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "email wrong"}

  mount_uploader :avatar, SchoolAvatarUploader
end
