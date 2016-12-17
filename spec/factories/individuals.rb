# == Schema Information
#
# Table name: individuals
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  location   :string
#  avatar     :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bg_img     :string
#
# Indexes
#
#  index_individuals_on_user_id  (user_id)
#

FactoryGirl.define do
	factory :individual do
	  first_name "Adam"
	  last_name "James"
	  user
	end
end
