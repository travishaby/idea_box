# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: "Travis", password: "password", role: "admin")
User.create(username: "Lani", password: "winnie", role: "admin")

User.create(username: "Nick", password: "kingdodo", role: "user")
User.create(username: "Val", password: "queendodo", role: "user")
