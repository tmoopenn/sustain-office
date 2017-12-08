# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.delete_all

eventA = Event.create!(title:"Living Writers Series", location: "Colgate Memorial Chapel", recurring: true, points: 1, description: "The fall 2017 Living Writers lineup includes three Pulitzer Prize winners of fiction, nonfiction, and poetry. Your level of participation is up to you.", image: "living_writers.png")
eventB = Event.create!(title:"ENST Brown Bag", location: "Alana Cultural Center, Multipurpose Room", recurring: false, points: 1, description: "Community Challenges & Sustainable Solutions - Seminar in Environmental Studies: Students from the ENST 490 seminar will present their work at this final ENST brown bag of the semester.")
eventC = Event.create!(title:"What if We Put Poverty First?", location: "Love Auditorium, Olin Hall", recurring: false, points: 1, description: "For the past three years that I’ve been writing at Grist, it’s been my job to try and figure out the answers to one big problem: How do we, as a species, feed ourselves without causing global collapse? Food moves to money and away from poverty, so I soon discovered the question I was really asking was: How do we tackle poverty without wrecking the planet? The answers still have a lot to do with agriculture, because 70 percent of the 700 million people living in extreme poverty across the globe are farmers, and no country has reduced poverty on a large scale without a corresponding investment in agriculture.

There’s a fundamental tension between these two goals because growth, the escalator out of poverty runs on fossil fuels and forests.

There are no perfect solutions. There’s always some tradeoff between alleviating poverty and protecting the environment. But there are good solutions: If we are smart, we can set our priorities to trade a little carbon for a lot of prosperity. My reporting on this issue has led me to the hypothesis that people who care about the environment and social justice should embrace change, growth, and innovation. We simply don’t have the technology, infrastructure, and basic housing to meet the needs of the global population. Traditionally the environmental movement has focused on stopping things — conservation and preservation aim to prevent change. But poor people need change. In this talk I’ll outline the historical evidence that suggests that growth — spurred by investments in small farms — can lead to mass reduction in poverty and environmental improvements.", image: "poverty_first.png")

Occurrence.delete_all

occ1 = Occurrence.create!(date_time: "December 14, 2017, 4:30 PM", event_id: eventA.id)
occ2 = Occurrence.create!(date_time: "January 14, 2018, 4:30 PM", event_id: eventA.id)
occ3 = Occurrence.create!(date_time: "February 14, 2018, 4:30 PM", event_id: eventA.id)
occ4 = Occurrence.create!(date_time: "December 15, 2018, 12:15PM", event_id: eventB.id)
occ5 = Occurrence.create!(date_time: "September 18, 2018, 4:30 PM", event_id: eventC.id)

User.delete_all

User.create!(name:"Vincent Van Gogh", classification:"faculty", tpoints: 8)
User.create!(name:"Rick Taylor",classification:"student",tpoints: 12 )
arno = User.create!(name:"Arno Holt",classification: "faculty",tpoints: 16)

Registree.delete_all

event = Event.where(:title => "Living Writers Series").first
event2 = Event.where(:title => "ENST Brown Bag").first
event3 = Event.where(:title => "What if We Put Poverty First?").first
user = User.first
rick = User.where(:name => "Rick Taylor").first
#event_participant = Participant.new

#event.participants << event_participant
user.events << event
event.occurrences << occ1
event.occurrences << occ2
event.occurrences << occ3
event2.occurrences << occ4
event3.occurrences << occ5
#user.participants << event_participant

rick.events << event
#event.users << rick

Registree.create!(:event_id => event.id,:user_id => arno.id)
