# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
College.destroy_all

College.new({name:"Amherst", address:"Cambridge, MA", emblem: "Amherst_College.png"}).save!
College.new({name:"Yale", address:"New Haven, CT", emblem: "Yale_University.png"}).save!
College.new({name:"Williams", address:"345 Boyer Ave, Walla Walla, WA", emblem: "Williams_College.png"}).save!
College.new({name:"Middlebury", address:"14 Old Chapel Rd, Middlebury, VT", emblem: "Middlebury_College.png"}).save!
College.new({name:"Bowdoin", address:"New Haven, CT", emblem: "Bowdoin_College.png"}).save!
College.new({name:"CIT", address:"345 Boyer Ave, Walla Walla, WA", emblem: "California_Institute_of_Technology.png"}).save!
College.new({name:"Carleton", address:"345 Boyer Ave, Walla Walla, WA", emblem: "Carleton_College.png"}).save!
College.new({name:"Claremont McKenna", address:"Cambridge, MA", emblem: "Claremont_McKenna_College.png"}).save!
College.new({name:"Duke", address:"New Haven, CT", emblem: "Duke_University.png"}).save!
College.new({name:"MIT", address:"14 Old Chapel Rd, Middlebury, VT", emblem: "Massachusetts_Institute_of_Technology.png"}).save!
College.new({name:"Stanford", address:"Cambridge, MA", emblem: "Stanford_University.png"}).save!


