# == Schema Information
#
# Table name: schools
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  location    :string
#  category    :string
#  logo        :string
#  reviews     :integer          default(0)
#  min_age     :integer
#  max_age     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  bg_img      :string
#
# Indexes
#
#  index_schools_on_user_id  (user_id)
#

FactoryGirl.define do
  factory :school do
    name "Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and"
    description "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    category "international"
    user
  end
end
