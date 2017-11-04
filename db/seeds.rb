# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.delete_all

Event.create!(title:"Class 1", date_time: "December 4, 2017, 4:00 PM", location: "Persson 201", recurring: false, description: "Learn about clean eating!")
Event.create!(title:"Class 2", date_time: "December 2, 2017, 1:00 PM", location: "McGregory 300", recurring: true, description: "Carbon!")
