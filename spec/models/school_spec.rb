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

RSpec.describe School, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

   context "validations" do

    context "has the right schema" do
      it{ should have_db_column(:name).of_type(:string) }
      it{ should have_db_column(:description).of_type(:text) }
      it{ should have_db_column(:location).of_type(:string) }
      it{ should have_db_column(:category).of_type(:string) }
      it{ should have_db_column(:avatar).of_type(:string) }
      it{ should have_db_column(:reviews).of_type(:integer) }
      it{ should have_db_column(:min_age).of_type(:integer) }
      it{ should have_db_column(:max_age).of_type(:integer) }
      it{ should have_db_column(:user_id).of_type(:integer) }
    end

    context "validates attributes" do
      it{ is_expected.to validate_presence_of(:name) }
    end

    describe "validates Associations" do
      it { is_expected.to have_many(:events) }
      it { is_expected.to belong_to(:user) }
    end
  end
end
