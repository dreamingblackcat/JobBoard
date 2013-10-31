class Resume < ActiveRecord::Base
  belongs_to :applicant
  has_many :applicant_education_histories,:through=>:applicant
  has_many :applicant_job_histories,:through=>:applicant
  attr_accessible :applicant_id, :published_at
  
end
