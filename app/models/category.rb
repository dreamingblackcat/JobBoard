class Category < ActiveRecord::Base
  has_many :job_posts
  attr_accessible :name
  
  def self.all_for_select
    self.all.map  do| a|
      [a.name,a.id]
    end
  end
  def self.all_for_navigation
    cats=[]
    arr=[]
    self.all.map do |a|
      cats << a
    end
    arr << cats[0,cats.count/2] << cats[cats.count/2+1,cats.count-1]
  end
  
end
