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

require 'rails_helper'

RSpec.describe Event, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  context "validations" do

    it "should have name and email and password_digest" do
      should have_db_column(:name).of_type(:string)
      should have_db_column(:description).of_type(:string)
      should have_db_column(:start_date).of_type(:date)
      should have_db_column(:end_date).of_type(:date)
      should have_db_column(:location).of_type(:string)
      should have_db_column(:start_time).of_type(:time)
      should have_db_column(:end_time).of_type(:time)
      should have_db_column(:min_age).of_type(:integer)
      should have_db_column(:max_age).of_type(:integer)

    end

   describe "validates presence of all attributes" do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:description) }
      it { is_expected.to validate_presence_of(:start_date) }
      it { is_expected.to validate_presence_of(:end_date) }
      it { is_expected.to validate_presence_of(:location) }
      it { is_expected.to validate_presence_of(:start_time) }
      it { is_expected.to validate_presence_of(:end_time) }
      it { is_expected.to validate_presence_of(:min_age) }
      it { is_expected.to validate_presence_of(:max_age) }

    end

     # happy_path
    describe "can be created when all attributes are present" do
      When(:event) { Event.create(
        name: "Rafia High School",
        description: "fadsfasafsd",
        start_date: "12-12-2020",
        end_date: "15-12-2020",
        location: "finland",
        start_time: "10:28:32",
        end_time: "11:28:32",
        min_age: 10,
        max_age: 15
      )}
      Then { event.valid? == true }
    end

     # unhappy_path
    describe "cannot be created without a name" do
      When(:event) { Event.create(
        description: "fadsfasafsd",
        start_date: "12-12-2020",
        end_date: "15-12-2020",
        location: "finland",
        start_time: "10:28:32",
        end_time: "11:28:32",
        min_age: 10,
        max_age: 15) }
      Then { event.valid? == false }
    end

    describe "cannot be created without a description" do
      When(:event) { Event.create(
        name: "Rafia High School",
        start_date: "12-12-2020",
        end_date: "15-12-2020",
        location: "finland",
        start_time: "10:28:32",
        end_time: "11:28:32",
        min_age: 10,
        max_age: 15) }
      Then { event.valid? == false }
    end

    describe "cannot be created without a start_date" do
      When(:event) { Event.create(
        name: "Rafia High School",
        description: "fadsfasafsd",
        end_date: "15-12-2020",
        location: "finland",
        start_time: "10:28:32",
        end_time: "11:28:32",
        min_age: 10,
        max_age: 15) }
      Then { event.valid? == false }
    end

    describe "cannot be created without a end_date" do
      When(:event) { Event.create(
        name: "Rafia High School",
        description: "fadsfasafsd",
        start_date: "12-12-2020",
        location: "finland",
        start_time: "10:28:32",
        end_time: "11:28:32",
        min_age: 10,
        max_age: 15) }
      Then { event.valid? == false }
    end

    describe "cannot be created without a location" do
      When(:event) { Event.create(
        name: "Rafia High School",
        description: "fadsfasafsd",
        start_date: "12-12-2020",
        end_date: "15-12-2020",
        start_time: "10:28:32",
        end_time: "11:28:32",
        min_age: 10,
        max_age: 15) }
      Then { event.valid? == false }
    end


    describe "cannot be created without a start_time" do
      When(:event) { Event.create(
        name: "Rafia High School",
        description: "fadsfasafsd",
        start_date: "12-12-2020",
        end_date: "15-12-2020",
        location: "finland",
        end_time: "11:28:32",
        min_age: 10,
        max_age: 15) }
      Then { event.valid? == false }
    end

    describe "cannot be created without a end_time" do
      When(:event) { Event.create(
        name: "Rafia High School",
        description: "fadsfasafsd",
        start_date: "12-12-2020",
        end_date: "15-12-2020",
        location: "finland",
        start_time: "10:28:32",
        min_age: 10,
        max_age: 15) }
      Then { event.valid? == false }
    end

    describe "cannot be created without a min_age" do
      When(:event) { Event.create(
        name: "Rafia High School",
        description: "fadsfasafsd",
        start_date: "12-12-2020",
        end_date: "15-12-2020",
        location: "finland",
        start_time: "10:28:32",
        end_time: "11:28:32",
        max_age: 15) }
      Then { event.valid? == false }
    end

     describe "cannot be created without a max_age" do
      When(:event) { Event.create(
        name: "Rafia High School",
        description: "fadsfasafsd",
        start_date: "12-12-2020",
        end_date: "15-12-2020",
        location: "finland",
        start_time: "10:28:32",
        end_time: "11:28:32",
        min_age: 10) }
      Then { event.valid? == false }
    end





  end
end
