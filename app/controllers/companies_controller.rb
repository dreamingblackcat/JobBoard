class CompaniesController < ApplicationController
  # GET /companies
  # GET /companies.json
  load_and_authorize_resource :user,:except=>[:show]
  load_and_authorize_resource :company,:through=>:user,:singleton=>true,:except=>[:show,:index]
  append_before_filter :check_for_guest,:only=>[:show]
  def index
     layout=layout_chooser(@user)
      @companies=Company.paginate(:page=>params[:page],:per_page=>2)
    respond_to do |format|
      format.html do
        render :action=>"index",:layout=>layout
      end
      format.json { render json: @companies }
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    layout=layout_chooser(@user)
    @company = Company.find(params[:id])
    @job_posts=@company.job_posts.paginate(:page=>params[:page],:per_page=>2)
    respond_to do |format|
      format.html do
        render :action=>"show",:layout=>layout
      end
      format.json { render json: @company }
    end
  end

  # GET /companies/new
  # GET /companies/new.json
  def new
    # @user=User.find(params[:user_id])
    # @company = Company.new(:user_id=>@user.id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/1/edit
  def edit
    #@company = Company.find(params[:id])
  end

  # POST /companies
  # POST /companies.json
  def create
    # @user=User.find(params[:user_id])
    # @company=Company.new(params[:company])
    # @company.user_id=@user.id
   # redirect_to [@company.user,@company]
    respond_to do |format|
      if @company.save
        format.html { redirect_to [@company.user,@company], notice: 'Company was successfully created.' }
        format.json { render json: @company, status: :created, location: @company }
      else
        format.html { render action: "new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.json
  def update
    #@company = Company.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to [@company.user,@company], notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
   # @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end


end
