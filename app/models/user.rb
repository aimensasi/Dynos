class User < ActiveRecord::Base

  
  has_one :school, :dependent => :destroy
  has_one :individual, :dependent => :destroy
  
  has_secure_password
  validates :password, presence: true, length: { in: 6..20 }
  validates :email, presence: true, uniqueness: true, 
  									format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "Invalid Email"}
	validates :role, :presence => true, :inclusion => {:in => ['school', 'individual']}  									
end
