class ApplicantJobPreference < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :location
  attr_accessible :applicant_id, :location_id, :prefer_expected_salary, :prefer_job_time, :prefer_start_available
end
