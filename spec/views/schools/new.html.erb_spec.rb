require 'rails_helper'

RSpec.describe "schools/new", type: :view do
  before(:each) do
    assign(:school, School.new(
      :name => "MyString",
      :description => "MyString",
      :location => "MyString",
      :level => "MyString",
      :category => "MyString",
      :avatar => "MyString"
    ))
  end

  it "renders new school form" do
    render

    assert_select "form[action=?][method=?]", schools_path, "post" do

      assert_select "input#school_name[name=?]", "school[name]"

      assert_select "input#school_description[name=?]", "school[description]"

      assert_select "input#school_location[name=?]", "school[location]"

      assert_select "input#school_level[name=?]", "school[level]"

      assert_select "input#school_category[name=?]", "school[category]"

      assert_select "input#school_avatar[name=?]", "school[avatar]"
    end
  end
end
