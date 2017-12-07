# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.delete_all

eventA = Event.create!(title:"Class 1", location: "Persson 201", recurring: false, points: 1, description: "Learn about clean eating!")
eventB = Event.create!(title:"Class 2", location: "McGregory 300", recurring: true, points: 2, description: "Carbon!")

Occurrence.delete_all

occ1 = Occurrence.create!(date_time: "January 20, 2018, 4:00 PM", event_id: eventA.id)
occ2 = Occurrence.create!(date_time: "December 31, 2018, 1:00 PM", event_id: eventB.id)

User.delete_all

User.create!(name:"Vincent Van Gogh", classification:"faculty", tpoints: 8)
User.create!(name:"Rick Taylor",classification:"student",tpoints: 12 )
arno = User.create!(name:"Arno Holt",classification: "faculty",tpoints: 16)

Registree.delete_all

event = Event.where(:title => "Class 1").first
event2 = Event.where(:title => "Class 2").first
user = User.first
rick = User.where(:name => "Rick Taylor").first
#event_participant = Participant.new

#event.participants << event_participant
user.events << event
event.occurrences << occ1
event2.occurrences << occ2
#user.participants << event_participant

rick.events << event
#event.users << rick

Registree.create!(:event_id => event.id,:user_id => arno.id)
