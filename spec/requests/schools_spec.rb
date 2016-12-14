# == Schema Information
#
# Table name: schools
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  location    :string
#  category    :string
#  avatar      :string
#  reviews     :integer
#  min_age     :integer
#  max_age     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

require 'rails_helper'

RSpec.describe "Schools", type: :request do
  describe "GET /schools" do
    it "works! (now write some real specs)" do
      get schools_path
      expect(response).to have_http_status(200)
    end
  end
end
