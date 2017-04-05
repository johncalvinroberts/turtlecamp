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

counselors = %w[John Stephane Jason Allen]

counselors.each do |counselor|
User.find_or_create_by(name: "#{counselor}"){|c| c.assign_attributes({
                      is_counselor: true,
                      email: "#{counselor}@test.com",
                      password: "password"})}.save
end

students = %w[Eunice Joyce Andrew Kevin David Joy Jazz Bernard Grace Bob Jason Bill
              Candy Sherry Lisa]

students.each do |student|
User.create(name: "#{student}",
            is_counselor: false,
            email: "#{student}@test.com",
            password: "password",
            counselor_ref: rand(1..4),
            current_school: "Shanghai Jiaotong High School")
end

50.times do |n|
  CollegeApp.create(category: ["Reach", "Target", "Safety"].sample,
                  deadline: DateTime.new(2017,11,30),
                  user: User.find_by(id: rand(5..User.count)),
                  college: College.find_by(id: rand(1..College.count)))
end

50.times do |n|
  Task.create(name: ["Write essay", "Talk to math teacher", "Get transcript", "Email counselor"].sample,
              due_date: Time.now + rand(1..100).days,
              status: ["pending", "approved", "not done"].sample,
              college_app: CollegeApp.find_by(id: rand(1..CollegeApp.count)))
end
