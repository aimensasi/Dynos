# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
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
#\

#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  role  

# 10.times do |n|  
# 	User.create(
# 		:email => "adam#{n}@gmail.com",
# 		:password => "1234567#{n}",
# 		:role => "school"
# 	)
# end

user_ids = User.ids
20.times do 
	school = School.new(
		:name => Faker::Company.name,
		:description => Faker::Lorem.paragraph(2),
		:location => Faker::Address.street_address,
		:category => ['private', 'public', 'international'].sample,
		:min_age => [2, 3, 1].sample,
		:max_age => [16, 17, 18, 19].sample,
		:user_id => user_ids.sample
	)
	if school.save
		puts "Created School with name of #{school.name}"
	else
		puts "Ops Error: #{school.errors.full_messages}"
	end
end

# :avatar => Faker::Company.logo