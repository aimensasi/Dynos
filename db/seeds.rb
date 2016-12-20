# 50.times do |n|  
# 	User.create(
# 		:email => "jorden#{n}@gmail.com",
# 		:password => "1234567#{n}",
# 		:role => "school"
# 	)
# end

# user_ids = User.ids

# 40.times do 
# 	school = School.new(
# 		:name => Faker::University.name,
# 		:description => Faker::Lorem.paragraph(2),
# 		:location => Faker::Address.street_address,
# 		:category => ['Private', 'Public', 'International'].sample,
# 		:min_age => [2, 3, 1].sample,
# 		:max_age => [16, 17, 18, 19].sample,
# 		:user_id => user_ids.sample
# 	)
# 	if school.save
# 		puts "Created School with name of #{school.name}"
# 	else
# 		puts "Ops Error: #{school.errors.full_messages}"
# 	end
# end


# 10.times do |n|  
# 	User.create(
# 		:email => "james#{n}@gmail.com",
# 		:password => "1234567#{n}",
# 		:role => "individual"
# 	)
# end

# users = User.where(:role => "individual")

# user_ids = users.ids

# 20.times do |n|
# 	unsplash = "https://unsplash.com/?photo=nvj-PDU98WU".gsub(/https/, 'http')

# 	individual = Individual.new(
# 		:first_name => Faker::Name.first_name,
# 		:last_name => Faker::Name.last_name,
# 		:location => Faker::Address.street_address,
# 		:user_id => user_ids.sample
# 	)
# 	if n == 3
# 		Individual.create(
# 			:first_name => Faker::Name.first_name,
# 			:last_name => Faker::Name.last_name,
# 			:remote_avatar_url => unsplash,
# 			:location => Faker::Address.street_address,
# 			:user_id => user_ids.sample
# 		)
# 	end

# 	if individual.save
# 		puts "Created individual with name of #{individual.name}"
# 	else
# 		puts "Ops Error: #{individual.errors.full_messages}"
# 	end
# end

school_ids = School.ids
location1 = Faker::Address.street_address
location3 = Faker::Address.street_address
location4 = Faker::Address.street_address
location5 = Faker::Address.street_address
30.times do |n|
	event = Event.new({
		:name => Faker::Lorem.sentence(6),
		:description => Faker::Lorem.paragraph(10),
		:date => Faker::Date.forward(30),
		:location => [location1, location3, location5, location4, location1].sample,
		:min_age => [2, 3, 1].sample,
		:max_age => [16, 17, 18, 19].sample, 
		:start_time => Faker::Time.forward(23, :evening),
		:end_time => Faker::Time.forward(23, :evening),
		:price => [300, 120, 30, 50, 1000].sample,
		:seats => [20, 30, 120, 10, 22].sample,
		:school_id => school_ids.sample
	})

	if event.save
		puts "Created event with name of #{event.name}"
	else
		puts "Ops Error: #{event.errors.full_messages}"
	end
	
end

# events_ids = Event.ids
# individual_ids = Individual.ids
# 70.times do |n| 
# 	ticket = Ticket.new(
# 		:event_id => events_ids.sample,
# 		:individual_id => individual_ids.sample
# 	)
# 	if ticket.save
# 		puts "Created #{n + 1} Ticket" 
# 	else
# 		puts "Error #{ticket.errors.full_messages} Ticket" 
# 	end

	
# end











