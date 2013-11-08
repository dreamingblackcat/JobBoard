class ApplicantEducationHistory < ActiveRecord::Base
  belongs_to :applicant
  has_attached_file :certificate,
  :path=>':rails_root/non-public/system/:attachment/:id/:style/:basename.:extension',
  :url=>':class/:id/:attachment'
  attr_accessible :course_of_study, :applicant_id, :diploma_degree_certificate, :institute_name, :location, :certificate
  validates :course_of_study,:presence=>true
  validates :diploma_degree_certificate,:presence=>true
  validates :institute_name,:presence=>true
  validates_attachment :certificate,:presence=>true,
                                    :content_type=>{:content_type=>'application/pdf',:message=>'must be pdf file type'},
                                    :size=>{:in=>0..1.megabytes,:message=>" must not be greater than 1 Megabyte!"}
                                    
  
end


