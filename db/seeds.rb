# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/seed/#{file_name}"))
end

Event.delete_all

eventA = Event.create!(title:"Living Writers Series", location: "Colgate Memorial Chapel", recurring: true, points: 1, description: "The Fall 2017 Living Writers lineup includes three Pulitzer Prize winners of fiction, nonfiction, and poetry. Your level of participation is up to you.", image: seed_image('living_writers.png'))
eventB = Event.create!(title:"ENST Brown Bag", location: "Alana Cultural Center, Multipurpose Room", recurring: false, points: 1, description: "Community Challenges & Sustainable Solutions - Seminar in Environmental Studies: Students from the ENST 490 seminar will present their work at this final ENST brown bag of the semester.", image: seed_image('brown_bag.jpg'))
eventC = Event.create!(title:"What if We Put Poverty First?", location: "Love Auditorium, Olin Hall", recurring: false, points: 1, description: "For the past three years that I’ve been writing at Grist, it’s been my job to try and figure out the answers to one big problem: How do we, as a species, feed ourselves without causing global collapse? Food moves to money and away from poverty, so I soon discovered the question I was really asking was: How do we tackle poverty without wrecking the planet? The answers still have a lot to do with agriculture, because 70 percent of the 700 million people living in extreme poverty across the globe are farmers, and no country has reduced poverty on a large scale without a corresponding investment in agriculture.

There’s a fundamental tension between these two goals because growth, the escalator out of poverty runs on fossil fuels and forests.

There are no perfect solutions. There’s always some tradeoff between alleviating poverty and protecting the environment. But there are good solutions: If we are smart, we can set our priorities to trade a little carbon for a lot of prosperity. My reporting on this issue has led me to the hypothesis that people who care about the environment and social justice should embrace change, growth, and innovation. We simply don’t have the technology, infrastructure, and basic housing to meet the needs of the global population. Traditionally the environmental movement has focused on stopping things — conservation and preservation aim to prevent change. But poor people need change. In this talk I’ll outline the historical evidence that suggests that growth — spurred by investments in small farms — can lead to mass reduction in poverty and environmental improvements.", image: seed_image('poverty_first.png'))
eventD = Event.create!(title:"Exhibit: Unsettled Conditions: How We Talk about the Environment and Our Place In It", location: "Longyear Museum of Anthropology", recurring: true, points: 2, description: "Unsettled Conditions: How We Talk about the Environment and Our Place in It is now on view at the Longyear Museum of Anthropology. From the Tuareg in the Sahara to the Inuit in the Arctic, and from island communities in the Pacific to communities in central New York, this student co-curated exhibition explores human interactions with diverse environments.  How do environments shape us, and how do we shape environments? How do we talk about the environment and our experiences within it, and why does that matter? How do we imagine our future environments, and what are we doing now to help shape those possibilities?", image: seed_image('unsettled_conditions.jpg'))

Occurrence.delete_all

occ1 = Occurrence.create!(date_time: "December 14, 2017, 4:30 PM", event_id: eventA.id)
occ2 = Occurrence.create!(date_time: "January 14, 2018, 4:30 PM", event_id: eventA.id)
occ3 = Occurrence.create!(date_time: "February 14, 2018, 4:30 PM", event_id: eventA.id)
occ4 = Occurrence.create!(date_time: "December 15, 2018, 12:15PM", event_id: eventB.id)
occ5 = Occurrence.create!(date_time: "September 18, 2018, 4:30 PM", event_id: eventC.id)
occ6 = Occurrence.create!(date_time: "November 7, 2018, 10:00 AM", event_id: eventD.id)
occ7 = Occurrence.create!(date_time: "November 8, 2018, 10:00 AM", event_id: eventD.id)
occ8 = Occurrence.create!(date_time: "November 9, 2018, 10:00 AM", event_id: eventD.id)
occ9 = Occurrence.create!(date_time: "November 10, 2018, 10:00 AM", event_id: eventD.id)


User.delete_all

joel = User.create!(name:"Joel Sommers", classification:"faculty", tpoints: 8)
phil = User.create!(name:"Phil Mulry",classification:"faculty",tpoints: 3 )
aaron = User.create!(name:"Aaron Gember-Jacobson",classification: "faculty",tpoints: 16)
troy = User.create!(name:"Troy Moo Penn", classification: "student", tpoints: 10)
char = User.create!(name:"Char Jablonski", classification: "faculty", tpoints: 20)
jesse = User.create!(name:"Jesse O'Loughlin", classification: "student", tpoints: 6)

Registree.delete_all

event1 = Event.where(:title => "Living Writers Series").first
event2 = Event.where(:title => "ENST Brown Bag").first
event3 = Event.where(:title => "What if We Put Poverty First?").first
event4 = Event.where(:title => "Exhibit: Unsettled Conditions: How We Talk about the Environment and Our Place In It").first

event1.occurrences << occ1
event1.occurrences << occ2
event1.occurrences << occ3
event2.occurrences << occ4
event3.occurrences << occ5
event4.occurrences << occ6
event4.occurrences << occ7
event4.occurrences << occ8
event4.occurrences << occ9

troy.registrees << Registree.create!(:event_id => event1.id,:user_id => troy.id)
troy.registrees << Registree.create!(:event_id => event3.id,:user_id => troy.id)
jesse.registrees << Registree.create!(:event_id => event3.id,:user_id => jesse.id)
aaron.registrees << Registree.create!(:event_id => event2.id,:user_id => aaron.id)
aaron.registrees << Registree.create!(:event_id => event1.id,:user_id => aaron.id)
char.registrees << Registree.create!(:event_id => event4.id,:user_id => char.id)
phil.registrees << Registree.create!(:event_id => event2.id,:user_id => phil.id)
joel.registrees << Registree.create!(:event_id => event1.id,:user_id => joel.id)
