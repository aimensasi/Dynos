require 'rails_helper'

RSpec.describe "schools/edit", type: :view do
  before(:each) do
    @school = assign(:school, School.create!(
      :name => "Wells High School",
      :description => "MyString",
      :location => "Finland",
      :level => "High School",
      :category => "International",
      :avatar => "MyString",
      :password => "123456",
      :password_confirmation => "123456",
      :email => "whs@hotmail.com"
    ))
  end

  it "renders the edit school form" do
    render

    assert_select "form[action=?][method=?]", school_path(@school), "post" do

      assert_select "input#school_name[name=?]", "school[name]"

      assert_select "input#school_description[name=?]", "school[description]"

      assert_select "input#school_location[name=?]", "school[location]"

      assert_select "input#school_level[name=?]", "school[level]"

      assert_select "input#school_category[name=?]", "school[category]"

      assert_select "input#school_avatar[name=?]", "school[avatar]"
    end
  end
end
