# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  date        :date
#  location    :string
#  start_time  :time
#  end_time    :time
#  min_age     :integer
#  max_age     :integer
#  school_id   :integer
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  bg_img      :string
#  seats       :integer          default(0), not null
#
# Indexes
#
#  index_events_on_school_id  (school_id)
#
# Foreign Keys
#
#  fk_rails_1beae4dfaa  (school_id => schools.id)
#

class Event < ActiveRecord::Base
	include PgSearch

  self.per_page = 10

  belongs_to :school
  has_many :tickets, :dependent => :destroy
  
  validates_presence_of :name, :description, :date, :location, :start_time, :end_time, :min_age, :max_age, :price, :school_id

  pg_search_scope :by_address, :against => :location, using: { :tsearch => {:prefix => true, :any_word => true} }

  def event_time
  	"#{start_time.strftime("%I:%M%p")} - #{end_time.strftime("%I:%M%p")}"
  end

  def event_date
  	date.strftime("%e %b %Y")
  end

  def month
  	date.strftime("%b")
  end

  def day
  	date.strftime("%e")
  end

  def age_range
  	"#{min_age} - #{max_age}"
  end

  def profile_cover
    return nil if self.bg_img.nil?
    if self.bg_img.file.present?
      self[:bg_img].cover.url
    else  
      nil  
    end
  end
end
