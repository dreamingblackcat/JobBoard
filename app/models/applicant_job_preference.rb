class ApplicantJobPreference < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :location
  attr_accessible :applicant_id, :location_id, :prefer_expected_salary, :prefer_job_time, :prefer_start_available
  JOB_TIMES=["full time","part time","freelance",]
  validate :job_time_validator
  validates :prefer_start_available,:presence=>true
  validate :prefer_start_available_date_restrictor
#this is a validator for job time to include in the pre-defined JOB_TIMES array
  def job_time_validator
     JOB_TIMES.each do|jt|
       if jt==prefer_job_time
          return
       end
     end
      errors.add(:prefer_job_time,"must be a valid job time")  
  end
  #this is date restriction validator for prefer start available date
  def prefer_start_available_date_restrictor
    if(prefer_start_available<Date.today)
       errors.add("Your start available date","must not be in the past")
    end
  end

end
