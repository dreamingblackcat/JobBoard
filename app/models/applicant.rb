class Applicant < ActiveRecord::Base
  # FIXME: whitelist all the attributes that should be whitelisted


  # TODO: add validations

  # OPTIMIZE: improve the SQL
  #after_save :save_photo
  belongs_to :user
  has_many :applicant_job_preferences, :dependent=>:destroy
  has_many :applicant_job_histories, :dependent=>:destroy
  has_many :applicant_education_histories, :dependent=>:destroy
  has_one :resume
  has_many :applicant_job_posts
  has_many :job_posts,:through=>:applicant_job_posts
  attr_accessible :applicant_address, :applicant_contact_email, :applicant_description, :applicant_dob, :applicant_gender,
                  :applicant_language, :applicant_marital_status, :applicant_name, :applicant_nrc, :applicant_phone_number, 
                  :applicant_skills,:user_id, :photo 
  
  has_attached_file :photo, :styles => { :medium => "300x300", :thumb => "100x100" }
  
  #validations
  validates :applicant_address,:presence=>true
  validates :applicant_contact_email,:uniqueness => { :case_sensitive => false }
  validate :applicant_dob_validator
  validates :applicant_gender,:presence=>true
  validates :applicant_marital_status,:presence=>true
  validates :applicant_name,:presence=>true
  validates :applicant_nrc,:presence=>true
  #validate :applicant_nrc_validator
  validate :email_format_validator
  validates_attachment :photo,:presence=>true,
                                    :content_type=>{:content_type=>/^image\/(png|gif|jpeg|jpg)/,:message=>'must be an image file type'},
                                    :size=>{:in=>0..1.megabytes,:message=>" must not be greater than 1 Megabyte!"}
   #validates_format_of :email, :with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i

  def applicant_dob_validator
    if(applicant_dob.year>(Date.today.year-16))
      errors.add("Birthday","must be at least 16 years less than today!")
    end
  end
  
  def email_format_validator
    if(applicant_contact_email !~ /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i)#/[a-z]+[a-z0-9]*@[a-z]+[a-z0-9]\.[a-z0-9]+/)
      errors.add("Contact Email","must be a valid email format")
    end
  end
  
  def applicant_nrc_validator
    if applicant_nrc !~ /[1-14]{1,2}\/[A-Za-z]{6,9}\((naing|n|ng){1}\)[0-9]{6}/
      errors.add("Nrc number","is not in correct format")
    end
  end
  
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
