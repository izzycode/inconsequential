# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

task = Task.find_or_create_by(description: "Learn Models")
task.sub_tasks.find_or_create_by(description: "Learn Validations")
task.sub_tasks.find_or_create_by(description: "Learn to use 'g'")

task = Task.find_or_create_by(description: "Learn Controllers")
task.update(due_date: 2.days.ago.to_date)

task = Task.find_or_create_by(description: "Learn Views")
task.update(due_date: 2.days.from_now.to_date)

task = Task.find_or_create_by(description: "Learn Migrations")
task.update(due_date: 1.week.from_now.to_date)

Task.find_or_create_by(description: "Learn Git")
Task.find_or_create_by(description: "Learn React")
Task.find_or_create_by(description: "Learn JavaScript")
Task.find_or_create_by(description: "Learn HTML")
Task.find_or_create_by(description: "Learn CSS")

puts "#{Task.count} tasks in the system..."
puts "#{SubTask.count} sub_tasks in the system..."
