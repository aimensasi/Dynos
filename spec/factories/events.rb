FactoryGirl.define do
  factory :event do
    name "MyString"
    description "MyString"
    start_date "2016-12-09"
    end_date "2016-12-09"
    location "MyString"
    start_time "2016-12-09 09:57:00"
    end_time "2016-12-09 09:57:00"
    min_age 1
    max_age 1
    school nil
  end
end
