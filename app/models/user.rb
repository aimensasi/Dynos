# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  role            :string
#

class User < ActiveRecord::Base

  has_secure_password

  has_one :school, :dependent => :destroy
  has_one :individual, :dependent => :destroy
  
  validates :password, presence: true, length: { in: 6..20 }
  validates :email, presence: true, uniqueness: true, 
  									format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "Invalid Email"}
	validates :role, :presence => true, :inclusion => {:in => ['school', 'individual']}  									
end
