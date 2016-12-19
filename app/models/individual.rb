# == Schema Information
#
# Table name: individuals
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  location   :string
#  avatar     :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bg_img     :string
#
# Indexes
#
#  index_individuals_on_user_id  (user_id) UNIQUE
#

class Individual < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	mount_uploader :bg_img, AvatarUploader

	belongs_to :user
	has_many :tickets, :dependent => :destroy

	validates_presence_of :first_name, :last_name
	validates_uniqueness_of :user

	
	def name 
		"#{first_name} #{last_name}".camelize
	end

	def profile_pic
		if self.avatar.file.present?
		  self.avatar.thumbnail.url
		else  
		  nil  
		end
	end

	def profile_cover
	  if self.bg_img.file.present?
	    self.bg_img.cover.url
	  else  
	    nil  
	  end
	end

	def uniq_tickets
		tickets.group(:individual_id, :event_id)
	end
end
