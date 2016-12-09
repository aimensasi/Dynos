require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      :name => "MyString",
      :description => "MyString",
      :location => "MyString",
      :min_age => 1,
      :max_age => 1,
      :school => nil
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input#event_name[name=?]", "event[name]"

      assert_select "input#event_description[name=?]", "event[description]"

      assert_select "input#event_location[name=?]", "event[location]"

      assert_select "input#event_min_age[name=?]", "event[min_age]"

      assert_select "input#event_max_age[name=?]", "event[max_age]"

      assert_select "input#event_school_id[name=?]", "event[school_id]"
    end
  end
end
