class JobPost < ActiveRecord::Base
  belongs_to :location
  belongs_to :category
  belongs_to :company
  attr_accessible :category_id, :company_id, :job_post_basic_salary, :job_type,:job_post_description, :job_post_end_date, :job_post_gender, :job_post_requirement, :job_post_start_date, :job_post_title, :location_id
end
