class Ticket < ActiveRecord::Base

	belongs_to :event
	belongs_to :user

	validates_presence_of :user, :event

end
