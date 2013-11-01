class ApplyJobsController < ApplicationController
  load_and_authorize_resource :user
  load_and_authorize_resource :applicant,:through=>:user,:singleton=>true
  
  layout "applicants"
  
  # show applied job-posts for applicants
  def index
    @user=current_user    
    @applicant=@user.applicant    
    @job_posts=@applicant.job_posts  
  end
  
  # applied or not job-posts for applicants
  def create
    @applicant=Applicant.find(params[:applicant_id])
    @job_post=JobPost.find(params[:job_post_id])
    @applicant.job_posts.each do |jp|
      if jp==@job_post then 
        redirect_to :back,:notice=>"AlreadY!"
        return
      end
    end
    @applicant.job_posts<<JobPost.where(:id=>params[:job_post_id])
    redirect_to :back,:notice=>"You have successfully applied job#{@applicant.job_posts.size}"   
  end
 
end
