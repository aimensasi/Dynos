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
#

class Individual < ActiveRecord::Base

	belongs_to :user
	has_and_belongs_to_many :events, :join_table => :events_users, :foreign_key => :user_id

	validates_presence_of :first_name, :last_name
end
