class Individual < ActiveRecord::Base

	belongs_to :user
	has_and_belongs_to_many :events, :join_table => :events_users, :foreign_key => :user_id

	validates_presence_of :first_name, :last_name
end
