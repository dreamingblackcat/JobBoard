class ApplicantEducationHistoriesController < ApplicationController
  # GET /applicant_education_histories
  # GET /applicant_education_histories.json
  def index
    @applicant_education_histories = ApplicantEducationHistory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @applicant_education_histories }
    end
  end

  # GET /applicant_education_histories/1
  # GET /applicant_education_histories/1.json
  def show
    @applicant_education_history = ApplicantEducationHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @applicant_education_history }
    end
  end

  # GET /applicant_education_histories/new
  # GET /applicant_education_histories/new.json
  def new
    @applicant_education_history = ApplicantEducationHistory.new(:applicant_id=>params[:applicant_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @applicant_education_history }
    end
  end

  # GET /applicant_education_histories/1/edit
  def edit
    @applicant_education_history = ApplicantEducationHistory.find(params[:id])
  end

  # POST /applicant_education_histories
  # POST /applicant_education_histories.json
  def create
    @applicant_education_history = ApplicantEducationHistory.new(params[:applicant_education_history])

    respond_to do |format|
      if @applicant_education_history.save
        format.html { redirect_to [@applicant_education_history.applicant.user,@applicant_education_history.applicant,@applicant_education_history], notice: 'Applicant education history was successfully created.' }
        format.json { render json: @applicant_education_history, status: :created, location: @applicant_education_history }
      else
        format.html { render action: "new" }
        format.json { render json: @applicant_education_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /applicant_education_histories/1
  # PUT /applicant_education_histories/1.json
  def update
    @applicant_education_history = ApplicantEducationHistory.find(params[:id])

    respond_to do |format|
      if @applicant_education_history.update_attributes(params[:applicant_education_history])
        format.html { redirect_to [@applicant_education_history.applicant.user,@applicant_education_history.applicant,@applicant_education_history], notice: 'Applicant education history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @applicant_education_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applicant_education_histories/1
  # DELETE /applicant_education_histories/1.json
  def destroy
    @applicant_education_history = ApplicantEducationHistory.find(params[:id])
    @applicant_education_history.destroy

    respond_to do |format|
      format.html { redirect_to applicant_education_histories_url }
      format.json { head :no_content }
    end
  end
end
