class ApplicantEducationHistory < ActiveRecord::Base
  belongs_to :applicant
  has_attached_file :certificate,
  :styles=>{:thumb=>'75x75>',:small=>'150x150>'},
  :path=>':rails_root/non-public/system/:attachment/:id/:style/:basename.:extension',
  :url=>':class/:id/:attachment'
  attr_accessible :course_of_study, :applicant_id, :diploma_degree_certificate, :institute_name, :location, :certificate
end


