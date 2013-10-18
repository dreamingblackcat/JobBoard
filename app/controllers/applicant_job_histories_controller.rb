class ApplicantJobHistoriesController < ApplicationController
  
    load_and_authorize_resource :user
    load_and_authorize_resource :applicant,:through=>:user,:singleton=>true
    load_and_authorize_resource :applicant_job_history,:through=>:applicant
  # GET /applicant_job_histories
  # GET /applicant_job_histories.json
  def index
    # @applicant_job_histories = ApplicantJobHistory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @applicant_job_histories }
    end
  end

  # GET /applicant_job_histories/1
  # GET /applicant_job_histories/1.json
  def show
    # @applicant_job_history = ApplicantJobHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @applicant_job_history }
    end
  end

  # # GET /applicant_job_histories/new
  # # GET /applicant_job_histories/new.json
  def new
    # @applicant_job_history = ApplicantJobHistory.new(:applicant_id=>params[:applicant_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @applicant_job_history }
    end
  end

  # # GET /applicant_job_histories/1/edit
  def edit
    # @applicant_job_history = ApplicantJobHistory.find(params[:id])
  end

  # # POST /applicant_job_histories
  # # POST /applicant_job_histories.json
   def create
    # @applicant_job_history = ApplicantJobHistory.new(params[:applicant_job_history])

    respond_to do |format|
      if @applicant_job_history.save
        format.html { redirect_to [@applicant_job_history.applicant.user,@applicant_job_history.applicant,@applicant_job_history], notice: 'Applicant job history was successfully created.' }
        format.json { render json: @applicant_job_history, status: :created, location: @applicant_job_history }
      else
        format.html { render action: "new" }
        format.json { render json: @applicant_job_history.errors, status: :unprocessable_entity }
      end
    end
   end

  # # PUT /applicant_job_histories/1
  # # PUT /applicant_job_histories/1.json
  def update
    # @applicant_job_history = ApplicantJobHistory.find(params[:id])

    respond_to do |format|
      if @applicant_job_history.update_attributes(params[:applicant_job_history])
        format.html { redirect_to [@applicant_job_history.applicant.user,@applicant_job_history.applicant,@applicant_job_history], notice: 'Applicant job history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @applicant_job_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # # DELETE /applicant_job_histories/1
  # # DELETE /applicant_job_histories/1.json
  # def destroy
  #   @applicant_job_history = ApplicantJobHistory.find(params[:id])
  #   @applicant_job_history.destroy

  #   respond_to do |format|
  #     format.html { redirect_to applicant_job_histories_url }
  #     format.json { head :no_content }
  #   end
  # end
end
