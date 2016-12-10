class Event < ActiveRecord::Base
  belongs_to :school
  has_and_belongs_to_many :users, dependent: :destroy
  validates_presence_of :name,:description, :start_date, :end_date, :location, :start_time, :end_time, :min_age, :max_age

end
