require 'rails_helper'

RSpec.describe "bookings/new", type: :view do
  before(:each) do
    assign(:booking, Booking.new(
      :event => nil,
      :user => nil
    ))
  end

  it "renders new booking form" do
    render

    assert_select "form[action=?][method=?]", bookings_path, "post" do

      assert_select "input#booking_event_id[name=?]", "booking[event_id]"

      assert_select "input#booking_user_id[name=?]", "booking[user_id]"
    end
  end
end