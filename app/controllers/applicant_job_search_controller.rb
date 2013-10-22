class ApplicantJobSearchController < ApplicationController
  #load_and_authorize_resource :user
  #load_and_authorize_resource :applicant,:through=>:user,:singleton=>true
  layout "applicants"
  def index
    @user=current_user    
    @applicant=@user.applicant
    if params[:category].nil? then
      @job_posts=JobPost.all
    else
      @job_posts=Category.where(:name=>params[:category]).first.job_posts
    end
  end
end
