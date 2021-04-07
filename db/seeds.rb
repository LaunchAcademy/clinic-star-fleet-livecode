# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
# Ship.create(name: 'USS Enterprise', ship_class: 'Galaxy', location: "Romulan Star Empire")
# Ship.create(name: 'Serenity', ship_class: 'Firefly', location: "Miranda")

ship1 = Starship.create(name: 'USS Enterprise', ship_class: 'Galaxy', location: "Romulan Star Empire")
ship2 = Starship.create(name: 'Serenity', ship_class: 'Firefly', location: "Miranda")

crew_member1 = CrewMember.create(first_name: "James", last_name: "Hook", specialty_division: "Pirate", starship: ship2)
crew_member2 = CrewMember.create(first_name: "James", last_name: "Kirk", specialty_division: "Catpain", starship: ship1)
crew_member3 = CrewMember.create(first_name: "Malcolm", last_name: "Reynolds", specialty_division: "Captain", starship: ship2)