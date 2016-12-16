# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  start_date  :date
#  end_date    :date
#  location    :string
#  start_time  :time
#  end_time    :time
#  min_age     :integer
#  max_age     :integer
#  school_id   :integer
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ActiveRecord::Base
	include PgSearch

  belongs_to :school
  
  has_and_belongs_to_many :users, dependent: :destroy
  validates_presence_of :name, :description, :date, :location, :start_time, :end_time, :min_age, :max_age, :price, :school_id

  pg_search_scope :by_address, :against => :location, using: { :tsearch => {:prefix => true, :any_word => true} }
end
