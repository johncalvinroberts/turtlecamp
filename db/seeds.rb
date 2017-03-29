# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
College.destroy_all

College.new({name:"Harvard", address:"Cambridge, MA"}).save!
College.new({name:"Yale", address:"New Haven, CT"}).save!
College.new({name:"Whitman", address:"345 Boyer Ave, Walla Walla, WA"}).save!
College.new({name:"Middlebury", address:"14 Old Chapel Rd, Middlebury, VT"}).save!
