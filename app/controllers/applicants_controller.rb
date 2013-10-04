class ApplicantsController < ApplicationController
  load_and_authorize_resource :user
  load_and_authorize_resource :applicant,:through=>:user,:singleton=>true
  # GET /applicants.json
  def index
   
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @applicants }
    end
  end

  # GET /applicants/1
  # GET /applicants/1.json
  def show
   
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @applicant }
    end
  end

  # GET /applicants/new
  # GET /applicants/new.json
  def new
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @applicant }
    end
  end

  # GET /applicants/1/edit
  def edit
    
  end

  # POST /applicants
  # POST /applicants.json
  def create
    
    respond_to do |format|
      if @applicant.save
        format.html { redirect_to user_applicant_path(current_user), notice: 'Applicant was successfully created.' }
        format.json { render json: @applicant, status: :created, location: @applicant }
      else
        format.html { render action: "new" }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /applicants/1
  # PUT /applicants/1.json
  def update
  

    respond_to do |format|
      if @applicant.update_attributes(params[:applicant])
        format.html { redirect_to user_applicant_path(@applicant.user), notice: 'Applicant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applicants/1
  # DELETE /applicants/1.json
  def destroy
   
    @applicant.destroy

    respond_to do |format|
      format.html { redirect_to applicants_url }
      format.json { head :no_content }
    end
  end
end
