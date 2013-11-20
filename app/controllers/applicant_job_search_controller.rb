class ApplicantJobSearchController < ApplicationController
  load_and_authorize_resource :user
  load_and_authorize_resource :applicant,:through=>:user,:singleton=>true
  layout "applicants"
  def index
    @user=current_user    
    @applicant=@user.applicant
    if params[:category].nil? then
      @job_posts=JobPost.active.paginate(:page=>params[:page],:per_page=>2)
    else
      @job_posts=Category.where(:name=>params[:category]).first.job_posts.active.paginate(:page=>params[:page],:per_page=>2)
    end
  end 
  
  # recommanded jobposts for applicants
  def recommendedjobposts
    @user=current_user
    @applicant=@user.applicant
    @applicant_job_preferences=@applicant.applicant_job_preferences
    respond_to do|format|
      format.html
    end
    
  end
end
