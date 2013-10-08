# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users=["aa","bb","cc","dd","ee","ff","gg","hh","ii","jj","kk"]
Company.destroy_all

10.times do|i|
  
  
  com=Company.new
  com.com_name=Faker::Company.name
  com.com_logo_name=Faker::Company.bs
  com.com_email=Faker::Internet.email
  com.com_address=Faker::Address.city
  com.com_web_url=Faker::Internet.domain_name
  com.com_phone_number=Faker::PhoneNumber.cell_phone
  com.com_fax_number= rand(100..900)
  com.com_description= Faker::Lorem.paragraph(sentence_count=3)
  com.com_logo_image_url=com.com_name + ".jpg"
  com.user_id= i
  com.save
  
end