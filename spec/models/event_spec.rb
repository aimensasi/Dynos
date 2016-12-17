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
#
# Indexes
#
#  index_events_on_school_id  (school_id)
#
# Foreign Keys
#
#  fk_rails_1beae4dfaa  (school_id => schools.id)
#

require 'rails_helper'

RSpec.describe Event, type: :model do

  let(:school) { create(:school) }

  describe "validations" do

    context "Schema validations" do
      it{ should have_db_column(:name).of_type(:string) }
      it{ should have_db_column(:description).of_type(:string) }
      it{ should have_db_column(:date).of_type(:date) }
      it{ should have_db_column(:location).of_type(:string) }
      it{ should have_db_column(:start_time).of_type(:time) }
      it{ should have_db_column(:end_time).of_type(:time) }
      it{ should have_db_column(:min_age).of_type(:integer) }
      it{ should have_db_column(:max_age).of_type(:integer) }

    end

   context "validates presence of all attributes" do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:description) }
      it { is_expected.to validate_presence_of(:date) }
      it { is_expected.to validate_presence_of(:location) }
      it { is_expected.to validate_presence_of(:start_time) }
      it { is_expected.to validate_presence_of(:end_time) }
      it { is_expected.to validate_presence_of(:min_age) }
      it { is_expected.to validate_presence_of(:max_age) }
      it { is_expected.to validate_presence_of(:price) }
    end
  end 

     # happy_path
    describe "can be created when all attributes are present" do
      When(:event) { Event.create(
        name: "Rafia High School",
        description: "fadsfasafsd",
        date: "12-12-2020",
        location: "finland",
        start_time: "10:28:32",
        end_time: "11:28:32",
        min_age: 10,
        max_age: 15,
        price: 120,
        school_id: school.id
      )}
      Then { event.valid? == true }
    end

     # unhappy_path
    describe "cannot when one of the attributes is missing" do
      When(:event) { Event.create(
        description: "fadsfasafsd",
        date: "12-12-2020",
        location: "finland",
        start_time: "10:28:32",
        end_time: "11:28:32",
        min_age: 10,
        max_age: 15) }
      Then { event.valid? == false }
    end

end
