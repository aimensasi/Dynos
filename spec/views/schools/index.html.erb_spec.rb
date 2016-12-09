require 'rails_helper'

RSpec.describe "schools/index", type: :view do
  before(:each) do
    assign(:schools, [
      School.create!(
        :name => "Wells High School",
        :description => "MyString",
        :location => "Finland",
        :level => "High School",
        :category => "International",
        :avatar => "MyString",
        :password => "123456",
        :password_confirmation => "123456",
        :email => "whs@hotmail.com"
      ),
      School.create!(
        :name => "Cheng High School",
        :description => "MyString",
        :location => "China",
        :level => "High School",
        :category => "Local",
        :avatar => "MyString",
        :password => "123456",
        :password_confirmation => "123456",
        :email => "chs@hotmail.com"
      )
    ])
  end

  it "renders a list of schools" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Level".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Avatar".to_s, :count => 2
  end
end
