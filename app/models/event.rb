class Event < ActiveRecord::Base
  belongs_to :school

  validates_presence_of :name,:description, :start_date, :end_date, :location, :start_time, :end_time, :min_age, :max_age

end
