# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(name:"Andres", username:"Andgarzonmal", email:"andgarzonmal@unal.edu.co", password:"123456")
user = User.first
Contact.create(name: "Aaron 2", phone_number: "+1 123 456 7899",email:"aaron@aaron.com", user_id: user.id)
Contact.create(name: "Aaron 3", phone_number: "+1 123 456 7899",email:"aaron@aaron.com", user_id: user.id)
Contact.create(name: "Aaron 4", phone_number: "+1 123 456 7899",email:"aaron@aaron.com", user_id: user.id)
Contact.create(name: "Aaron 5", phone_number: "+1 123 456 7899",email:"aaron@aaron.com", user_id: user.id)
Contact.create(name: "Aaron 6", phone_number: "+1 123 456 7899",email:"aaron@aaron.com", user_id: user.id)
Contact.create(name: "Aaron 7", phone_number: "+1 123 456 7899",email:"aaron@aaron.com", user_id: user.id)