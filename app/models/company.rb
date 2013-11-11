class Company < ActiveRecord::Base
  belongs_to :user
  has_many :job_posts, dependent: :destroy
  
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  attr_accessible :com_address, :com_description, :com_email, :com_fax_number, :com_logo_name, :com_name, :com_phone_number, :com_web_url, :user_id,:photo 
  #validations
  validates :com_address,:presence=>true
  validates :com_description, :presence=>true
  validates :com_email,:presence=>true
  validate :email_format_validator
  validates_attachment :photo,:presence=>true,
                                    :content_type=>{:content_type=>/^image\/(png|gif|jpeg|jpg)/,:message=>'must be an image file type'},
                                    :size=>{:in=>0..1.megabytes,:message=>" must not be greater than 1 Megabyte!"}
  validates :com_logo_name,:presence=>true
  validates :com_name,:presence=>true
  validates :com_phone_number,:presence=>true
    
  def email_format_validator
    if(com_email !~ /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i)#/[a-z]+[a-z0-9]*@[a-z]+[a-z0-9]\.[a-z0-9]+/)
      errors.add("Contact Email","must be a valid email format")
    end
  end
end
