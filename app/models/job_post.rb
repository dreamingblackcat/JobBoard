class JobPost < ActiveRecord::Base
  belongs_to :location
  belongs_to :category
  belongs_to :company
  has_many :applicant_job_posts
  has_many :job_posts,:through=>:applicant_job_posts
  attr_accessible :category_id, :company_id, :job_post_basic_salary, :job_type,:job_post_description, :job_post_end_date, :job_post_gender, :job_post_requirement, :job_post_start_date, :job_post_title, :location_id

  def self.contain_job_id(id)
    self.find_each do |jp|
     if jp.id==id then  return true end
    end
    return false
  end
  
  def self.recommend(job_preference)
    JobPost.joins(:location)
    .where('locations.id=:location_id AND job_posts.job_type=:job_type AND job_posts.job_post_basic_salary=:salary',
    {:location_id=>job_preference.location_id,:job_type=>job_preference.prefer_job_time,:salary=>job_preference.prefer_expected_salary})
  end
end
