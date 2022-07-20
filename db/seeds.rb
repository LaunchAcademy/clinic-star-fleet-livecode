# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
StarShip.create(name: 'USS Enterprise', ship_class: 'Galaxy', location: "Romulan Star Empire")
StarShip.create(name: 'Serenity', ship_class: 'Firefly', location: "Miranda")
CrewMember.create(first_name: "Mal", last_name: "Reynolds", specialty_division: "Misbehavior")
