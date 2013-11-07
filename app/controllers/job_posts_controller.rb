class JobPostsController < ApplicationController
  
  load_and_authorize_resource :user,:except=>[:show,:destroy,:index]
  load_and_authorize_resource :company,:through=>:user,:singleton=>true,:except=>[:show,:destroy,:index]
  load_and_authorize_resource :job_post,:through=>:company,:except=>[:show,:index,:destroy]
  
  layout "companies"
  
  def index
    # @job_posts = JobPost.all
    if(params[:category].nil?)
      @job_posts=JobPost.paginate(:page=>params[:page],:per_page=>2)
    else
      @job_posts=Category.find_by_name(params[:category]).job_posts.paginate(:page=>params[:page],:per_page=>2)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @job_posts }
    end
  end
  
  def new
    # @company = Company.find(params[:company_id])
    # @job_post = @company.job_posts.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job_post }
    end
  end
  
  def show
    @user=User.find(params[:user_id])
    layout=layout_chooser(@user)
    @job_post=JobPost.find(params[:id])
    respond_to do |format|
      format.html do 
        render :action=>"show", :layout=>layout
        
      end    
      format.json { render json: @job_post }
    end
  end
  
  def create
    # @company = Company.find(params[:company_id])
    # @job_post = @company.job_posts.create(params[:job_post])
    
    respond_to do |format|
      if @job_post.save
        format.html { redirect_to [@company.user,@company,@job_post], notice: 'Job Post was successfully created.' }
        format.json { render json: @job_post, status: :created, location: @job_post }
      else
        format.html { render action: "new" }
        format.json { render json: @applicant_job_preference.errors, status: :unprocessable_entity }
      end
    end   
  end
  def edit
    # @company = Company.find(params[:company_id])
    # @job_post=@company.job_posts.find(params[:id])
    
  end
  def update
    # @company = Company.find(params[:company_id])
    # @job_post=@company.job_posts.find(params[:id])
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
    authorize! :destroy,@job_post
    respond_to do |format|
      format.html { redirect_to [@job_post.company.user,@job_post.company] }
      format.json { head :no_content }
    end
  end
    
end
