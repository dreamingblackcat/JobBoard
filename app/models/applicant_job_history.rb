class ApplicantJobHistory < ActiveRecord::Base
	belongs_to :applicant
  attr_accessible :address, :applicant_id, :company_name, :end_date, :job_title, :reason, :start_date
end
