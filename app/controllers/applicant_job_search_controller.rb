class ApplicantJobSearchController < ApplicationController
  load_and_authorize_resource :user
  load_and_authorize_resource :applicant,:through=>:user,:singleton=>true
  
  def index
    @job_posts=JobPost.all
    
  end
end
