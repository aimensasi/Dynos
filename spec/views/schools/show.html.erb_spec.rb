require 'rails_helper'

RSpec.describe "schools/show", type: :view do
  before(:each) do
    @school = assign(:school, School.create!(
      :name => "Name",
      :description => "Description",
      :location => "Location",
      :level => "Level",
      :category => "Category",
      :avatar => "Avatar"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/Level/)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/Avatar/)
  end
end
