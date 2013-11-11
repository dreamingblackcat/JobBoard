class Location < ActiveRecord::Base
   has_many :job_posts
  attr_accessible :name
  #validations
  validates :name,:presence=>true
  
  def self.all_for_select
    self.all.map  do| a|
      [a.name,a.id]
    end
  end
end
