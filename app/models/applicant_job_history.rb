class ApplicantJobHistory < ActiveRecord::Base
	belongs_to :applicant
  attr_accessible :address, :applicant_id, :company_name, :end_date, :job_title, :reason, :start_date
  validates :address,:presence=> true
  validates :company_name,:presence=>true
  validate :validate_passed_dates_or_not
  validates :job_title,:presence=>true
  
 def validate_passed_dates_or_not
   if(start_date>=Date.today)
    errors.add(:start_date,"must be a date in the past ")
   end
   if(end_date>Date.today)
     errors.add(:end_date,"must not be in the future")
   end
 end
end
