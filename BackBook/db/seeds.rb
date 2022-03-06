# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: 'AAAA', email: 'a@gmail.com', password: 'AAAAAA', role: "user")
User.create(name: 'BBBB', email: 'b@gmail.com', password: 'BBBBBB', role: "user")
User.create(name: 'CCCC', email: 'c@gmail.com', password: 'CCCCCC', role: "user")
User.create(name: 'Admin', email: 'admin@gmail.com', password: 'password', role: "admin")
