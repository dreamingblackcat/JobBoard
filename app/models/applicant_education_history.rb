class ApplicantEducationHistory < ActiveRecord::Base
  belongs_to :applicant
  has_attached_file :certificate
  attr_accessible :course_of_study, :applicant_id, :diploma_degree_certificate, :institute_name, :location, :certificate
end
