# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# College.destroy_all

College.find_or_create_by(name:"Amherst College"){|c| c.assign_attributes({address:"Cambridge, MA", emblem: "Amherst_College.png", website: "www.amherst.edu"})}.save
College.find_or_create_by(name:"Yale University"){|c| c.assign_attributes({address:"New Haven, CT", emblem: "Yale_University.png", website: "www.yale.edu"})}.save
College.find_or_create_by(name:"Williams College"){|c| c.assign_attributes({address:"345 Boyer Ave, Walla Walla, WA", emblem: "Williams_College.png", website: "www.williams.edu"})}.save
College.find_or_create_by(name:"Middlebury College"){|c| c.assign_attributes({address:"14 Old Chapel Rd, Middlebury, VT", emblem: "Middlebury_College.png", website: "www.middlebury.edu"})}.save
College.find_or_create_by(name:"Bowdoin College"){|c| c.assign_attributes({address:"New Haven, CT", emblem: "Bowdoin_College.png", website: "www.bowdoin.edu"})}.save
College.find_or_create_by(name:"CalTech"){|c| c.assign_attributes({address:"345 Boyer Ave, Walla Walla, WA", emblem: "California_Institute_of_Technology.png", website: "www.caltech.edu"})}.save
College.find_or_create_by(name:"Carleton College"){|c| c.assign_attributes({address:"345 Boyer Ave, Walla Walla, WA", emblem: "Carleton_College.png", website: "www.carleton.edu"})}.save
College.find_or_create_by(name:"Claremont McKenna College"){|c| c.assign_attributes({address:"Cambridge, MA", emblem: "Claremont_McKenna_College.png", website: "www.cmc.edu"})}.save
College.find_or_create_by(name:"Duke University"){|c| c.assign_attributes({address:"New Haven, CT", emblem: "Duke_University.png", website: "www.duke.edu"})}.save
College.find_or_create_by(name:"Massachusetts Institute of Technology"){|c| c.assign_attributes({address:"14 Old Chapel Rd, Middlebury, VT", emblem: "Massachusetts_Institute_of_Technology.png", website: "www.mit.edu"})}.save
College.find_or_create_by(name:"Stanford University"){|c| c.assign_attributes({
                            address:"Cambridge, MA",
                            emblem: "Stanford_University.png",
                            website: "www.stanford.edu"})}.save
College.find_or_create_by(name:"Brown University"){|c| c.assign_attributes({
                            address:"Providence, RI",
                            emblem: "Brown_University_174405.png",
                            website: "www.brown.edu"})}.save
College.find_or_create_by(name:"Columbia University"){|c| c.assign_attributes({
                            address:"New York, NY",
                            emblem: "Columbia.png",
                            website: "www.columbia.edu"})}.save
College.find_or_create_by(name:"Dartmouth College"){|c| c.assign_attributes({
                            address:"Dartmouth, VT",
                            emblem: "Dartmouth.png",
                            website: "www.dartmouth.edu"})}.save
College.find_or_create_by(name:"Harvard University"){|c| c.assign_attributes({
                            address:"Cambridge, MA",
                            emblem: "Harvard_University_170686.png",
                            website: "www.harvard.edu"})}.save
College.find_or_create_by(name:"Johns Hopkins"){|c| c.assign_attributes({
                            address:"Baltimore, MD",
                            emblem: "JHU.png",
                            website: "www.jhu.edu"})}.save

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
            email: "#{student}@qq.com",
            password: "password",
            counselor_ref: rand(1..4),
            current_school: ["Chengdu Foreign Languages School",
              "Shanghai Jiaotong High School", "Wuxi #1 High School",
              "Beijing #4 High School"].sample,
            app_year: ["2016-2017", "2017-2018", "2018-2019"].sample,
            satm: [1880,1970,2000,2050,2070,2200, 2220,2280,2370].sample,
            toeflr: rand(99..119))
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
