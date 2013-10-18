class JobPostsController < ApplicationController
  layout "companies"
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
    redirect_to [@company.user,@company,@job_post]
  end
  def edit
    @company = Company.find(params[:company_id])
    @job_post=@company.job_posts.find(params[:id])
    
  end
  def update
    @company = Company.find(params[:company_id])
    @job_post=@company.job_posts.find(params[:id])
    respond_to do |format|
      if @job_post.update_attributes(params[:job_post])
        format.html { redirect_to [@job_post.company.user,@job_post.company,@job_post], notice: 'Job Posts was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @job_post=JobPost.find(params[:id])
    @job_post.destroy

    respond_to do |format|
      format.html { redirect_to job_posts_url }
      format.json { head :no_content }
    end
  end
    
end
