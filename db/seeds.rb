# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(name:"Andres", username:"Andgarzonmal", email:"andgarzonmal@unal.edu.co", password:"123456")
user = User.first
Contact.create(name: "Aaron", user_id: user.id)