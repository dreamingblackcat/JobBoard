class JobPost < ActiveRecord::Base
  belongs_to :location
  belongs_to :category
  belongs_to :company
  has_many :applicant_job_posts
  has_many :applicants,:through=>:applicant_job_posts
  attr_accessible :category_id, :company_id, :job_post_basic_salary, :job_type,:job_post_description, :job_post_end_date, :job_post_gender, :job_post_requirement, :job_post_start_date, :job_post_title, :location_id
  
  #validations
  
  before_save :fill_salary_if_blank
  before_update :fill_salary_if_blank
  validates :job_type,:presence=>true
  validate :job_type_validator
  validates :job_post_description,:presence=>true
  validates :job_post_start_date,:presence=>true
  validates :job_post_end_date,:presence=>true
  validate :end_date_greater_than_today_and_start_date
  validates :job_post_gender,:presence=>true
  validates :job_post_requirement,:presence=>true
  validates :job_post_title,:presence=>true
  #end date must be greateer than today and start date
  def end_date_greater_than_today_and_start_date
    if(job_post_end_date < Date.today) then errors.add(:job_post_end_date,"must be at least today or in the future") end
    if(job_post_end_date < job_post_start_date) then errors.add(:job_post_end_date,"must be greater than start date") end
  end
  
  #this method is called every save and update call and fill the salary with 0 if necessary
  def fill_salary_if_blank
    if(job_post_basic_salary.nil?) then self.job_post_basic_salary=0 end
 
  end
  
  #this method validates job type with JOB_TIMES constant declared in environment.rb
  def job_type_validator
     JOB_TIMES.each do|jt|
       if jt===job_type
          return
       end
     end
      errors.add(:job_type,"must be a valid job time")  
  end
  #data and business logic methods
  # def self.contain_job_id(id)
    # self.find_each do |jp|
     # if jp.id==id then  return true end
    # end
    # return false
  # end
  
  def self.recommend(job_preference)
    JobPost.active.joins(:location)
    .where('locations.id=:location_id OR job_posts.job_type=:job_type OR job_posts.job_post_basic_salary=:salary',
    {:location_id=>job_preference.location_id,:job_type=>job_preference.prefer_job_time,:salary=>job_preference.prefer_expected_salary})
  end
  
  #DELETE EXPIRED
  scope :active,where('job_post_end_date >= ?',Date.today)
end
