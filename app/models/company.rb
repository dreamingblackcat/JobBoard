class Company < ActiveRecord::Base
  belongs_to :user
  has_many :job_posts, dependent: :destroy
  
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  attr_accessible :com_address, :com_description, :com_email, :com_fax_number, :com_logo_image_url, :com_logo_name, :com_name, :com_phone_number, :com_web_url, :user_id,:photo 
  
end
