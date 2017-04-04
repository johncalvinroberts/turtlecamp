# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# College.destroy_all

College.find_or_create_by(name:"Amherst"){ |c| c.assign_attributes({address:"Cambridge, MA", emblem: "Amherst_College.png"})}.save
College.find_or_create_by(name:"Yale"){ |c| c.assign_attributes({address:"New Haven, CT", emblem: "Yale_University.png"})}.save
College.find_or_create_by(name:"Williams"){ |c| c.assign_attributes({address:"345 Boyer Ave, Walla Walla, WA", emblem: "Williams_College.png"})}.save
College.find_or_create_by(name:"Middlebury"){|c| c.assign_attributes({address:"14 Old Chapel Rd, Middlebury, VT", emblem: "Middlebury_College.png"})}.save
College.find_or_create_by(name:"Bowdoin"){|c| c.assign_attributes({address:"New Haven, CT", emblem: "Bowdoin_College.png"})}.save
College.find_or_create_by(name:"CIT"){|c| c.assign_attributes({address:"345 Boyer Ave, Walla Walla, WA", emblem: "California_Institute_of_Technology.png"})}.save
College.find_or_create_by(name:"Carleton"){|c| c.assign_attributes({address:"345 Boyer Ave, Walla Walla, WA", emblem: "Carleton_College.png"})}.save
College.find_or_create_by(name:"Claremont McKenna"){|c| c.assign_attributes({address:"Cambridge, MA", emblem: "Claremont_McKenna_College.png"})}.save
College.find_or_create_by(name:"Duke"){|c| c.assign_attributes({address:"New Haven, CT", emblem: "Duke_University.png"})}.save
College.find_or_create_by(name:"MIT"){|c| c.assign_attributes({address:"14 Old Chapel Rd, Middlebury, VT", emblem: "Massachusetts_Institute_of_Technology.png"})}.save
College.find_or_create_by(name:"Stanford"){|c| c.assign_attributes({address:"Cambridge, MA", emblem: "Stanford_University.png"})}.save
