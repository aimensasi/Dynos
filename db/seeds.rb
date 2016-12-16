# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts "-----------------------------------------------------------------"
puts "Adding school"

100.times do
  user = User.new
  user.email = Faker::Internet.free_email
  user.password = "abc123456"
  user.role = "school"


  if user.save
  school = School.new
  school.name = Faker::Educator.secondary_school
  school.description = Faker::Lorem.paragraph(2)
  school.location = Faker::Address.street_address
  school.category = ["private","government","international"].sample(1)
  school.avatar = Faker::Avatar.image("my-own-slug", "50x50")
  school.reviews = Faker::Number.between(1, 10)
  school.min_age = Faker::Number.between(1, 3)
  school.max_age = Faker::Number.between(4, 20)
  school.cover = Faker::Avatar.image
    if school.save
      rand(1..10).times do

        event = Event.new
        event.name = Faker::Book.title
        event.description = Faker::Lorem.paragraph(2)
        event.date = "2016-" + rand(1..12).to_s +  "-" + rand(1..20).to_s
        event.location = Faker::Address.street_address
        event.start_time = rand(1..10).to_s +  ":" + rand(0..59).to_s
        event.end_time = rand(11..23).to_s +  ":" + rand(0..59).to_s
        event.min_age = Faker::Number.between(1, 3)
        event.max_age = Faker::Number.between(4, 20)
        event.school_id = school.id
        event.price = Faker::Number.between(1, 1000)
        event.save
      end
    end


  end
end

puts "-----------------------------------------------------------------"
puts "Adding Individual"

100.times do
  user = User.new
  user.email = Faker::Internet.free_email
  user.password = "abc123456"
  user.role = "individual"

  if user.save
    individual = Individual.new
    individual.first_name = Faker::Name.first_name
    individual.last_name = Faker::Name.last_name
    individual.location = Faker::Address.street_address
    individual.avatar = Faker::Avatar.image("my-own-slug", "50x50")
    individual.user_id = user.id
      if individual.save
        event = Event.find(rand(Event.first.id..(Event.count.round(0))))
        events_user = EventsUser.new
        events_user.event_id = event.id
        events_user.user_id = individual.id
        events_user.tickets_count = 1
        events_user.total_price = events_user.tickets_count * event.price.to_i
        events_user.save
      end

  end
end

puts "------------------------------------------------"
puts "creating specific school"

  user = User.new
  user.email = "monkey@gmail.com"
  user.password = "abc123456"
  user.role = "school"
    if user.save
      school = School.new
      school.name = "Taylor’s International school"
      school.description = "Taylor’s International School (TIS) is the latest addition to the Taylor’s Education Group. It provides exceptional learning environments for children from Early Years to Secondary.TIS offers a global learning experience based on the highly valued National Curriculum for England that leads to excellence in IGCSE qualifications.The School provides holistic learning with emphasis on character building that is grounded in the best of Eastern and Western values. It also offers a strong foundation in English, Mandarin and Bahasa Malaysia.Continuing Taylor’s fine tradition of excellence in developing the nation’s youth into well-rounded and purposeful leaders, ready to contribute and take their productive place in the global community, TIS aims to be an exceptional international curriculum school in the neighbourhood"
      school.location = "No 9 Jalan 1/75C, Off Jalan Pria Taman Maluri, 55100 Kuala Lumpur, Malaysia"
      school.category = "international"
      school.reviews = Faker::Number.between(1, 10)
      school.min_age = 13
      school.max_age = 18
    end

puts "------------------------------------------------"
puts "creating specific individual"

  user = User.new
  user.email = "chicken@gmail.com"
  user.password = "abc123456"
  user.role = "individual"
  if user.save
    individual = Individual.new
    individual.first_name = "chicken"
    individual.last_name = "run"
    individual.location = "111,chicken on the run, taman chicken rice , 31000 Malaysia"
    individual.avatar = Faker::Avatar.image("my-own-slug", "50x50")
    individual.user_id = user.id
  end
