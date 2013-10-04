class JobPostsController < ApplicationController
  
  def index
    @job_posts = JobPost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @job_posts }
    end
  end
  
  def new
    @company = Company.find(params[:company_id])
    @job_post = @company.job_posts.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job_post }
    end
  end
  
  def show
    
    @job_post = JobPost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job_post }
    end
  end
  
  def create
    @company = Company.find(params[:company_id])
    @job_post = @company.job_posts.create(params[:job_post])
    redirect_to [@company,@job_post]
  end
end
