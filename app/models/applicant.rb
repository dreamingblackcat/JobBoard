class Applicant < ActiveRecord::Base
  attr_accessible :app_address, :app_contact_email, :app_description, :app_dob, :app_gender, :app_language, :app_marital_status, :app_name, :app_nrc, :app_phone_number, :app_skills, :app_url, :user_id

  belongs_to :user


end
