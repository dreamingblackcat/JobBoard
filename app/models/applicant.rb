class Applicant < ActiveRecord::Base
  
  #after_save :save_photo
  belongs_to :user
  has_many :applicant_job_preferences, dependent: :destroy
  attr_accessible :applicant_address, :applicant_contact_email, :applicant_description, :applicant_dob, :applicant_gender, :applicant_language, :applicant_marital_status, :applicant_name, :applicant_nrc, :applicant_phone_number, :applicant_skills, :applicant_url, :user_id, :photo 
  
  has_attached_file :photo, :styles => { :medium => "300x300", :thumb => "100x100" }
  
  
  
  # def load_photo_file=(data)
     # # Record the filename
     # self.applicant_url = data.original_filename
     # # Store the data for later use
     # @photo_data = data
   # end
# 
   # # Called when save is completed
   # def save_photo     
#      
     # if @photo_data
       # directory = "public/pdf-files/"
       # # Write the data out to a file
       # path = File.join(directory,self.applicant_url)
       # File.open(path, 'wb') do |f|
         # f.write(@photo_data.read)
       # end
       # #@photo_data = nil
     # end
   #end
  
end
