# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Roadmap.create(user_id: -1, rating:5, country:"europe")
Roadmap.create(user_id: -2, rating:5, country:"noneurope")
Task.create(name:"Housing", roadmap_id: -1, done: false, description:"", application_time:"The duration of the entire process varies from two weeks to a month depending on the time of year. Applications earlier than three months before the scheduled date of departure will not be accepted.")
