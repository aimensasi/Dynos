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

FactoryGirl.define do
  factory :school do
    name "Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and"
    description "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    category "international"
    user
  end
end
