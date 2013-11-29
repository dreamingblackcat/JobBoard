# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users=["aa","bb","cc","dd","ee","ff","gg","hh","ii","jj","kk","ll","mm","nn","oo","pp","qq","rr","ss","tt","ss"]
# Company.destroy_all
# Create THE admin user
User.destroy_all
puts "Destroyed all user,User count is#{User.all.count}"
Company.destroy_all
admin=User.new
admin.email="admin@gmail.com"
admin.password=admin
admin.role="admin"
admin.skip_confirmation!
admin.save!
puts "admin created!"
20.times do|i|
  user=User.new
  user.email="#{users[i]}@gmail.com"
  user.password=users[i]
  user.role=(i%2===0)?"applicant":"company"
  user.skip_confirmation!
  user.save!
  puts "user created!"
  
end
if(Applicant.destroy_all)then puts "applicant resetted"end

User.where(:role=>"applicant").each do |user|
      app=Applicant.new
      app.applicant_name=Faker::Name.name
      app.applicant_nrc=rand(0..10)
      app.applicant_contact_email=Faker::Internet.email
      app.applicant_gender=["male","female"].sample
      app.applicant_marital_status=["married","single"].sample
      app.applicant_dob=Date.today.months_ago(rand(240..300))-rand(1..30)
      app.applicant_address=Faker::Address.street_address
      app.applicant_phone_number="09#{rand(5050000..5059999)}"
      app.applicant_language="english"
      app.applicant_skills=Faker::Lorem.sentence
      app.applicant_description=Faker::Lorem.sentence
      app.user_id=user.id
      app.photo_file_name="missing.png"
      if(app.save!)then puts "applicant saved for user #{user.id}" else puts "applicant not save for user #{user.id}"end

end

User.where(:role=>"company").each do|user|
  com=Company.new
  com.com_name=Faker::Company.name
  com.com_logo_name=Faker::Company.bs
  com.com_email=Faker::Internet.email
  com.com_address=Faker::Address.city
  com.com_web_url=Faker::Internet.domain_name
  com.com_phone_number=Faker::PhoneNumber.cell_phone
  com.com_fax_number= rand(100..900)
  com.com_description= Faker::Lorem.paragraph(sentence_count=3)
  com.user_id= user.id
  com.photo_file_name="missing.png"
  if(com.save!)then puts "company saved for user #{user.id}" else puts "company not save for user #{user.id}"end
  
end

Category.destroy_all
Location.destroy_all

20.times do
  cc=Category.new
  cc.name= Faker::Internet.domain_name
  cc.save
  
  aa=Location.new
  aa.name= Faker::Address.city
  aa.save
end