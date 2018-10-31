# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Task.find_or_create_by(description: "Learn Models")
Task.find_or_create_by(description: "Learn Controllers")
Task.find_or_create_by(description: "Learn Views")
Task.find_or_create_by(description: "Learn Migrations")
Task.find_or_create_by(description: "Learn Git")
Task.find_or_create_by(description: "Learn React")
Task.find_or_create_by(description: "Learn JavaScript")
Task.find_or_create_by(description: "Learn HTML")
Task.find_or_create_by(description: "Learn CSS")

puts "#{Task.count} tasks in the system..."