# == Schema Information
#
# Table name: tickets
#
#  event_id      :integer
#  individual_id :integer
#
# Indexes
#
#  index_tickets_on_event_id       (event_id)
#  index_tickets_on_individual_id  (individual_id)
#

class Ticket < ActiveRecord::Base

	belongs_to :event
	belongs_to :individual

	validates_presence_of :individual, :event

end