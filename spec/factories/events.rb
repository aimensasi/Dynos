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

FactoryGirl.define do
  factory :event do
    name "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    description "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    date "2016-12-09"
    location "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    start_time "2016-12-09 09:57:00"
    end_time "2016-12-09 09:57:00"
    min_age 2
    max_age 1
    price 120
    school
  end
end
