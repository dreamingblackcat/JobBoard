class ApplicantJobPost < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :job_post
  
end